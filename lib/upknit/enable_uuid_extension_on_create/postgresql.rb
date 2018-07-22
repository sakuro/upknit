require 'active_record/tasks/postgresql_database_tasks'

module Upknit
  module EnableUuidExtensionOnCreate
    # An extension to ActiveRecord::Tasks::PostgreSQLDatabaseTasks
    #
    # When prepended, this module enhances .create to enable UUID.
    module PostgreSQL
      def create(master_established=false)
        super
        connection.enable_uuid
      end

      def self.prepend(mod)
        mod.extend(self)
      end
    end
  end
end

ActiveRecord::Tasks::PostgreSQLDatabaseTasks.prepend Upknit::EnableUuidExtensionOnCreate::PostgreSQL
