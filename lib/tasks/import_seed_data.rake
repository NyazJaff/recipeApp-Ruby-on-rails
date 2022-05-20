require 'json'

desc "Import seed data into database"
task :import_seed_data  => [:environment] do

  path =  Rails.root.join('lib', 'assets', 'seed_data')
  Dir.glob("#{path}/recipes-*.json").each do |file|
    language = file.split('-').last[0..1]

    next unless File.file? file
    file_data =  FastJsonparser.load(file)

    file_data.each do |recipe_h|
      ActiveRecord::Base.transaction do

        category = Category.find_or_create_by(description: recipe_h[:category])

        recipe                  = FoodRecipe.new
        recipe.title            = recipe_h[:title] || recipe_h[:name]
        recipe.author           = recipe_h[:author] if recipe_h[:author].present?
        recipe.cook_time        = recipe_h[:cook_time]
        recipe.prep_time        = recipe_h[:prep_time]
        recipe.rating           = recipe_h[:ratings]
        recipe.image_url        = recipe_h[:image] if recipe_h[:image].present?
        recipe.language         = language
        recipe.people_quantity  = recipe_h[:people_quantity] if recipe_h[:people_quantity].present?
        recipe.budget           = recipe_h[:budget]          if recipe_h[:budget].present?
        recipe.difficulty       = recipe_h[:difficulty]      if recipe_h[:difficulty].present?
        recipe.category         = category
        recipe.save

       recipe_h[:ingredients].map do |description|

          ingredient = Ingredient.find_or_create_by(description: description)
          RecipeIngredient.find_or_create_by(
            food_recipe: recipe,
            ingredient: ingredient
          )
          puts "finished #{recipe.title}"
        end
      end
    end
  end
end
