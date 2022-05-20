class FoodRecipesController < ApplicationController

  def index
    @recipes = FoodRecipe.paginate :page => params[:page], per_page: 25

  end
end
