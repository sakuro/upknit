require 'rails/generators/generated_attribute'

module Upknit
  # A module which let migrations declare UUID type on references
  module SetDefaultReferenceTypeToUuid
    def options_for_migration
      super.tap do |options|
        if reference? && !polymorphic?
          options[:type] ||= :uuid
        end
      end
    end
  end
end

Rails::Generators::GeneratedAttribute.prepend Upknit::SetDefaultReferenceTypeToUuid
