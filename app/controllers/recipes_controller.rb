class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user = current_user

    if recipe.save
      redirect_to recipe, notice: 'Recipe was successfully created.'
    else
      render :new
      flash[:error] = 'Recipe was not created.'
    end
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

  private

  def recipe_params
    params.require(:new_recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
