# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_18_092328) do
  create_table "categories", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_categories_on_description"
  end

  create_table "food_recipes", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "title", null: false
    t.string "author"
    t.string "cook_time", null: false
    t.string "prep_time", null: false
    t.string "image_url"
    t.string "difficulty"
    t.string "budget"
    t.integer "people_quantity"
    t.string "language"
    t.integer "category_id"
    t.decimal "rating", precision: 3, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author"], name: "index_food_recipes_on_author"
    t.index ["title", "category_id", "rating"], name: "index_food_recipes_on_title_and_category_id_and_rating"
    t.index ["title", "category_id"], name: "index_food_recipes_on_title_and_category_id"
    t.index ["title"], name: "index_food_recipes_on_title"
  end

  create_table "ingredients", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_ingredients_on_description"
  end

  create_table "recipe_ingredients", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "food_recipe_id"
    t.integer "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_recipe_id", "ingredient_id"], name: "index_recipe_ingredients_on_food_recipe_id_and_ingredient_id"
  end

end
