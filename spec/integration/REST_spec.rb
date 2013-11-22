=begin
require "spec_helper"

describe RestaurantsController do
  rest_name = 'test_rest'
  test_rest = FactoryGirl.create(:restaurant, :name => rest_name)

  describe "GET #index" do
    
    it "data on page" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.body).to include(rest_name)
    end
  end
end
=end
