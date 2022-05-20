class FoodRecipe < ApplicationRecord
  belongs_to :category
  has_many :ingredients

  # validates :title, :author, :cook_time, :prep_time, presence: true
end
