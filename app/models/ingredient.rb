class Ingredient < ApplicationRecord

  has_many :recipe_ingredients
  validates :description, presence: true, uniqueness: true

  before_save :shorten_description

  def shorten_description
    self.description = description[0..254] if description.present?
  end
end
