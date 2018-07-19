require 'rails_helper'

RSpec.describe Upknit::Engine do
  describe 'extension' do
    it 'enables pgcryto extension' do
      expect(ActiveRecord::Base.connection.extensions).to include('pgcrypto')
    end
  end

  describe 'model migration' do
    around do |example|
      Dir.chdir 'spec/dummy' do
        system 'bin/rails generate model book title:string author:references --quiet'
        example.run
        system 'bin/rails destroy model book --quiet'
      end
    end

    let(:migration_file) { Dir[File.join(__dir__, '../dummy/db/migrate/*_create_books.rb')].first }
    let(:migration_content) { File.read(migration_file) }

    it 'sets default primary key to UUID' do
      expect(migration_content).to match(/create_table :books, id: :uuid/)
    end

    it 'sets default type of references to UUID' do
      expect(migration_content).to match(/t\.references :author.*, type: :uuid/)
    end
  end
end
