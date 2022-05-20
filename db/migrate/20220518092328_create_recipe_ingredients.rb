class CreateRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :food_recipe_id
      t.integer :ingredient_id

      t.timestamps null: false
    end

    add_index :recipe_ingredients, [:food_recipe_id, :ingredient_id]
  end
end
