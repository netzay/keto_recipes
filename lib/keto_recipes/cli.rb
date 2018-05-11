class KetoRecipes::CLI

	def call
		list_recipes
		menu
		details
	end

	def list_recipes
		puts "------------------- Keto Recipes ------------------------".bold.blue
		@recipes = KetoRecipes::Recipe.today
		@recipes.each.with_index(1) do |recipe, i|
			puts "#{i}. #{recipe.name}".italic.green
		end
		puts "Type the number of the recipe you want to see (or exit to leave:)".italic.magenta
	end

	def menu
		input = nil
		while input != "exit"
			input = gets.strip.downcase
			
			if input.to_i > 0
				the_recipe = @recipes[input.to_i-1]
				puts "#{the_recipe.name}".bold.green
				puts "1. Ingredients".bold.blue
				puts "2. Directions and URL to print".bold.blue
				puts "Type 1 or 2 for details, list to see all or exit:".italic.magenta
				details
				#binding.pry
			elsif input == "list"
				list_recipes	
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
				puts "#{the_recipe.name}".bold.green
				puts "Ingredients:".bold.blue
				puts "#{the_recipe.ingredients}".bold.cyan
				puts "------------------------------------------------------------------------------".yellow
				puts "Type list if you want to see another recipe or exit to leave".italic.magenta
			when "2"
				puts "Directions".bold.blue
				puts "#{the_recipe.directions}".bold.cyan
				puts "To see/print full recipe visit: #{the_recipe.print_url}".underline.blue
				puts "-------------------------------------------------------------------------------".yellow
				puts "Type list if you want to see another recipe or exit to leave".italic.magenta
			when "list"
				list_recipes
			when "exit"
				good_bye
			else 
				puts "Not a valid entry, please try again.".red
			end		
	end

	def good_bye
		puts "Hope you enjoyed the recipes!".bold.blue
		puts "---------------------------------------------------------------------------".yellow
	end
end
