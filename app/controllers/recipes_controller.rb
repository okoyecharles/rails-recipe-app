class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      redirect_to recipes_path
      flash[:success] = 'Recipe deleted Successfully'
    else
      redirect_to recipe
      flash[:error] = 'Couldnt delete recipe'
    end
  end
end
