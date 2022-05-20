class Ingredient < ApplicationRecord

  has_many :food_recipes
  validates :description, presence: true, uniqueness: true

  before_save :shorten_description

  def shorten_description
    self.description = description[0..254] if description.present?
  end
end
