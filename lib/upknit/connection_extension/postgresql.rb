require 'active_record/connection_adapters/postgresql_adapter'

# An extension to {ActiveRecord::ConnectionAdapters::PostgresqlAdapter}.
#
# When included, this module adds two methods to support UUID extension
# * #enable_uuid
# * #uuid_extension
module Upknit
  module ConnectionExtension
    module PostgreSQL
      # Enables a extension which adds UUID function to the system.
      # @return [void]
      def enable_uuid
        enable_extension(uuid_extension)
      end

      # Returns the name of UUID extension which should be used in current connection.
      # @return [String] Name of the extension
      def uuid_extension
        (UUID_EXTENSIONS & available_extensions).first
      end

      private

      # UUID support extensions in desired order
      # Note: Use of uuid-ossp for random UUID(v4) is discouraged
      # https://www.postgresql.org/docs/9.6/static/uuid-ossp.html
      UUID_EXTENSIONS = %w(pgcrypto uuid-ossp)
      private_constant :UUID_EXTENSIONS

      def available_extensions
        exec_query('SELECT Name FROM pg_available_extensions').cast_values
      end
    end
  end
end

ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.include Upknit::ConnectionExtension::PostgreSQL
