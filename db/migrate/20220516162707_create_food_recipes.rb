class CreateFoodRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :food_recipes do |t|
      t.string     :title,     null: false
      t.string     :author
      t.string     :cook_time, null: false
      t.string     :prep_time, null: false
      t.string     :image_url
      t.string     :difficulty
      t.string     :budget
      t.integer    :people_quantity
      t.string     :language
      t.integer    :category_id
      t.decimal    :rating,    precision: 3,     scale:       2,   default: 0.0

      t.timestamps
    end

    add_index :food_recipes, [:title, :category_id]
    add_index :food_recipes, [:title, :category_id, :rating]
    add_index :food_recipes, [:title]
    add_index :food_recipes, [:author]

  end
end
