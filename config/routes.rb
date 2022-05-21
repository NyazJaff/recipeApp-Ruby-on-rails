Rails.application.routes.draw do
  root 'food_recipes#index'

  resources :food_recipes, only: :index
end
