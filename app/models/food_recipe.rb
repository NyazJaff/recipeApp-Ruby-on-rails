class FoodRecipe < ApplicationRecord
  belongs_to :category
  has_many :recipe_ingredients

  validates :title, :author, :cook_time, :prep_time, presence: true

  def ingredients_to_s
    recipe_ingredients.collect { |ing| ing.ingredient.description }.join(', ')
  end

end
