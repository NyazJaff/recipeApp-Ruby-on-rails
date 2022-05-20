class Category < ApplicationRecord

  has_and_belongs_to_many :food_recipes

  validates :description, presence: true, uniqueness: true
end
