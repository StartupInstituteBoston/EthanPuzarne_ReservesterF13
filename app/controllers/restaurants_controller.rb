class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.order('name')
  end

  def show
    # Show a single restaurant with link to edit or destroy
    unless @restaurant = Restaurant.find_by(id: params[:id])
      redirect_to :back, notice: "This restaurant does not exist"
    end    
    
  end

  def new
    # display a form to submit a new restaurant
    # form includes name, description, location, phonenumber
    @restaurant = Restaurant.new()
  end

  def create
    # receive data from new and create the restaurant.
    # display confirmation method and link to show
    
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render action:'new'
    end
  end

  def edit
    # show same form as "new"
    # populate form with restaurant data
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def update
    # receive data from edit form and implement it
    # display confirmation of data change
    @restaurant = Restaurant.find_by(id: params[:id])
    if @restaurant.update(params[:restaurant].permit(:name,:description,:street,:city,:state,:zip,:phone,:photo))
      redirect_to @restaurant
    else
      render 'edit'
    end
  end


  def destroy
    # display confirmation for the destruction
    # when user clicks yes, destroy the index in the database
    @restaurant = Restaurant.find_by(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name,:description,:street,:city,:state,:zip,:phone,:photo)
    end
end
