require 'rails_helper'

RSpec.describe Upknit::Engine do
  describe 'extension' do
    it 'enables pgcryto extension', focus: true do
      expect(ActiveRecord::Base.connection.extensions).to include('pgcrypto')
    end
  end
end
