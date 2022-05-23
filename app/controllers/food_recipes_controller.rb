require 'will_paginate/array'
require 'recipe_ingredient'

class FoodRecipesController < ApplicationController

  def index
    @recipes = FoodRecipe.all
    if params['search_by_ingredient']
      @recipes = Recipe::Ingredient.find_by_ingredients(params['search_by_ingredient'].gsub("'", ''))
    end

    @recipes = @recipes.paginate :page => params[:page], per_page: 25

  end
end
