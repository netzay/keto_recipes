class KetoRecipes::CLI

	def call
		list_recipes
		menu
		good_bye
	end

	def list_recipes
		puts "Keto Recipes"
		@recipes = KetoRecipes::Recipe.today
		@recipes.each.with_index(1) do |recipe, i|
			puts "#{i}. #{recipe.name} - #{recipe.ingredients} - #{recipe.directions}."
		end
	end

	def menu
		input = nil
		while input != "exit"
			puts "Enter number of recipe you want to see or type list or exit:"
			input = gets.strip.downcase
			
			if input.to_i > 0
				the_recipe = @recipes[input.to_i-1]
				puts "#{the_recipe.name} - #{the_recipe.ingredients} - #{the_recipe.directions}."
			elsif input == "list"
				list_recipes
			else
				puts "Please type number for recipe, list or exit."
			end
		end
	end

	def good_bye
		puts "Hope you enjoyed the recipes"
	end
end
