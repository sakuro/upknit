require 'active_support/concern'
require 'upknit/connection_extension'

module Upknit
  module SetDefaultPrimaryKeyToUuid
    extend ActiveSupport::Concern

    included do
      initializer 'upknit.set_default_primary_key_to_uuid', after: :load_config_initializers do
        ActiveRecord::Base.establish_connection
        uuid_extension = ActiveRecord::Base.connection&.uuid_extension
        config.app_generators do |g|
          case uuid_extension
          when 'pgcrypto'
            g.orm :active_record, primary_key_type: :uuid
          when 'uuid-ossp'
            g.orm :active_record, primary_key_type: 'uuid, default: -> { "uuid_generate_v4()" }'
          else
            # UUID not supported
            Rails.logger.warn('upknit gem is installed, but UUID is not supported')
          end
        end
        Rails.logger.info('Default primary key is set to UUID.')
      rescue ActiveRecord::NoDatabaseError
        Rails.logger.info('No database found. Setting default primary key to UUID is skipped.')
      end
    end
  end
end

Upknit::Engine.include Upknit::SetDefaultPrimaryKeyToUuid
