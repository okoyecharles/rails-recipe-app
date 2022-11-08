class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      redirect_to foods_path
      flash[:success] = 'Food created successfully'
    else
      render :new
      flash[:error] = 'There was an error creating your food.'
    end
  end

  private

  def food_params
    params.require(:new_food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
