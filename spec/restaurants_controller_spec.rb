require "spec_helper"

describe RestaurantsController do
  
  describe "#show" do
    let(:restaurant) {FactoryGirl.create(:restaurant) }

    it "should display the show template for the restaurant" do
      get :show, id: restaurant.id

      expect(assigns(:restaurant)).to eq restaurant

      assigns(:restaurant).should eq restaurant
      expect(response).to render_template("show")
              
    end

  end

end
