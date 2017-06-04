module Upknit
  class Engine < ::Rails::Engine
  end
end

require 'upknit/connection_extension'
require 'upknit/enable_uuid_extension_on_create'
