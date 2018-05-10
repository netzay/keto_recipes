class KetoRecipes::CLI

	def call
		list_recipes
		menu

	end

	def list_recipes
		puts "------------------- Keto Recipes ------------------------"
		@recipes = KetoRecipes::Recipe.today
		@recipes.each.with_index(1) do |recipe, i|
			puts "#{i}. #{recipe.name}" 
		end
		puts "Type the corresponding number of the recipe you want to see or type exit to leave:"
	end

	def menu
		input = nil
		while input != "exit"
			input = gets.strip.downcase
			
			if input.to_i > 0
				the_recipe = @recipes[input.to_i-1]
				puts "#{the_recipe.name}" 
				puts "1. Ingredients"
				puts "2. Directions and URL to print"
				puts "Type 1 or 2 for details, list to see all or exit:"
				details
			elsif input == "list"
				menu	
			elsif input == "exit"
				good_bye
			end
		end
	end

	def details
		input = nil
		input = gets.strip.downcase
		the_recipe = @recipes[input.to_i-1]
			case input
			when "1"
				puts "Ingredients:"
				puts "#{the_recipe.ingredients}"
				puts "------------------------------------------------------------------------------"
				puts "Type list to see another recipe or exit to leave"
			when "2"
				puts "Directions"
				puts "#{the_recipe.directions}"
				puts "To see/print full recipe visit: #{the_recipe.print_url}"
				puts "-------------------------------------------------------------------------------"
				puts "Type list to see another recipe or exit to leave"
			when "list"
				menu
			when "exit"
				good_bye
			else 
				puts "Not a valid entry, please try again."
			end		
	end

	def good_bye
		puts "Hope you enjoyed the recipes!"
	end
end
