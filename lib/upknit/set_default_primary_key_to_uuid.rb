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
            $stderr.ptus "upknit gem is installed, but UUUID is not supported"
            # UUID not supported
          end
        end
      end
    end
  end
end

Upknit::Engine.include Upknit::SetDefaultPrimaryKeyToUuid

