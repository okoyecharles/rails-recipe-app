class RecipeFoodsController < ApplicationController
  def create
    recipe_food = RecipeFood.new(recipe_food_params)

    if recipe_food.save
      flash[:success] = 'Food added successfully'
    else
      flash[:error] = 'There was an issue adding the food'
    end

    redirect_to recipe_path(recipe_food_params['recipe_id'])
  end

  def destroy
    recipe_food = RecipeFood.find(params[:id])

    if recipe_food.destroy
      flash[:success] = 'Ingredient deleted successfully'
    else
      flash[:error] = 'There was an issue deleting the ingredient'
    end

    redirect_to recipe_path(recipe_food.recipe)
  end

  private

  def recipe_food_params
    params.require(:new_recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
