require 'rails_helper'

RSpec.describe 'Items', :type => :request do
  describe 'GET /items' do
    it "displays items on the index" do
      get items_path
      expect(response.status).to be(200)
    end
  end
end