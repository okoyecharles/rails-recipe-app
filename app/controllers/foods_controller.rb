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

  def destroy
    food = Food.find(params[:id])
    if food.destroy
      flash[:success] = 'Food deleted successfully'
    else
      flash[:error] = 'There was an error deleting your food.'
    end

    redirect_to foods_path
  end

  private

  def food_params
    params.require(:new_food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
