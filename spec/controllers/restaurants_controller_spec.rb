
require "spec_helper"

describe RestaurantsController do
  rest_name = "Hey, I'm a restaurant"

  describe "GET #index" do
    it "renders #index" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "#show" do
    let(:restaurant) { FactoryGirl.build(:restaurant, :name => rest_name)}
    before {Restaurant.stub(:find) {restaurant} }

    context "restaurant is found" do
    end

    context "restaurant is not found" do
    end
    it "returns correct restaurant" do
      get 'show', :id => "crap"
      expect(assigns(:restaurant)).to eq(restaurant)
    end
  end

  describe "GET #new" do
    it "renders #new" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    #does this generate a restaurant object?
    context "create succeeds" do
      post :create
      # verify that response is to show function
      assert_redirected_to restaurant_path(:restaurant)
    end

    context "create fails" do
      post :create
      restaurant.name = ""
      # verify that restaurant with no name will return to new
      assert_redirected_to :new
    end
  end

  describe "GET #edit" do
    it "no id fail" do
      expect { get :edit }.to raise_error(ActionController::UrlGenerationError)
    end
    
    it "gets restaurant data" do
      rest_name = 'test_rest'
      test_rest = FactoryGirl.create(:restaurant, :name => rest_name)
      # still needs to test whether restaurant is pulled correctly
      get :edit, :id => test_rest.id
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(assigns(:restaurant).name).to eq(rest_name)
    end
  end

  describe "PATCH #update" do
#does this correctly edit the restaurant in question
    it "updates restaurant data" do
      rest_old_name = 'test_rest'
      rest_new_name = 'real_rest'
      test_rest = FactoryGirl.create(:restaurant, :name => rest_old_name)
    end
  end
  

end

=begin
  describe "#show" do
    let!(:restaurant) {Restaurant.create(name:"Sexy Restaurant") }

    it "renders show" do
      get :show
    end

    it "" do
      get :show, id: restaurant.id

      expect(assigns(:restaurant)).to eq restaurant

      assigns(:restaurant).should eq restaurant
      expect(response).to render_template("show")
              
    end

  end
=end

