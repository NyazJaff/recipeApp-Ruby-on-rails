class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :description, null: false

      t.timestamps null: false
    end

    add_index :categories, [:description]
  end
end
