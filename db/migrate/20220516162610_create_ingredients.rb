class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string     :description, null: false

      t.timestamps null: false
    end

    add_index :ingredients, [:description]
  end
end
