require 'active_support/concern'

module Upknit
  # A module to add an initializer for enabling uuid_extension on establishing connection
  module EnableUuidExtensionOnConnect
    extend ActiveSupport::Concern

    included do
      initializer 'upknit.enable_uuid_extension', after: 'active_record.initialize_database' do
        return unless ActiveRecord::Base.connection
        ActiveRecord::Base.connection.instance_eval do
          enable_extension(uuid_extension) unless extension_enabled?(uuid_extension)
        end
      end
    end
  end
end

Upknit::Engine.include Upknit::EnableUuidExtensionOnConnect
