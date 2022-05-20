class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :food_recipe
end
