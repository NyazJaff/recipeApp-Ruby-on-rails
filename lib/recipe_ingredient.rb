module Recipe
  class Ingredient
    def self.find_by_ingredients(ingredients)
      recipes =  FoodRecipe.all
      ingredients_array = ingredients.split(',')

      return recipes if ingredients_array.size == 0

      sql = "Select food_recipes.id, count(food_recipes.id) as 'ingredient_count' from food_recipes
                  join recipe_ingredients ri on food_recipes.id = ri.food_recipe_id
                  join ingredients i on ri.ingredient_id = i.id
      where i.description like '%#{ingredients_array.first.strip}%'"
      ingredients_array[1..-1].each do |ing|
        sql += " OR i.description like '%#{ing.strip}%' "
      end

      sql += "
      group by food_recipes.id
      order by ingredient_count desc"

      result = ActiveRecord::Base.connection.execute(sql)

      recipes =  FoodRecipe.none
      return recipes if result.size == 0

      result.to_a.collect {|record| FoodRecipe.find(record.first)}
    end
  end
end
