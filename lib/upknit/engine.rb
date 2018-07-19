module Upknit
  class Engine < ::Rails::Engine
  end
end

require 'upknit/connection_extension'
require 'upknit/enable_uuid_extension_on_create'
require 'upknit/set_default_primary_key_to_uuid'
require 'upknit/set_default_reference_type_to_uuid'
