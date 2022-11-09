class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, class_name: 'RecipeFood'

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  def all_ingredients
    # All ingredients that are in the recipe
    RecipeFood.where(recipe_id: id)
  end

  def available_foods
    # All foods that are not in the recipe
    Food.where.not(id: all_ingredients.map(&:food_id))
  end
end
