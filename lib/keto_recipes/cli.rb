class KetoRecipes::CLI

	def call
		list_recipes
		menu
	end

	def list_recipes
		#puts "Enter the number of the Keto Recipe you want to learn more about:"
		@recipes = KetoRecipes::Recipe.today
		@recipes.each.with_index(1) do |recipe, i|
			puts "#{i}. #{recipe.name}" 
			 #-{recipe.ingredients} - #{recipe.directions}.
		end
	end

	def menu
		input = nil
		while input != "exit"
			puts "Type the number for the recipe you'd like to see more about, list or exit to leave:"
			input = gets.strip.downcase
			
			if input == "list"
				list_recipes
			elsif input == "exit"
				good_bye
			elsif input.to_i > 0
				the_recipe = @recipes[input.to_i-1]
				puts "#{the_recipe.name}" 
				puts "1. Ingredients"
				puts "2. Print via URL"
				puts "Choose 1 or 2 for more info!"

				input = gets.strip.downcase
					case input
					when "1"
						puts "#{the_recipe.ingredients}"
					when "2"
						puts "#{the_recipe.directions} - #{the_recipe.print_url}"
					else 
						puts "Not a valid entry"
					end
				end
			end
	end


	def good_bye
		puts "Hope you enjoyed the recipes"
	end
end
