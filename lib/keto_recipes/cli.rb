class KetoRecipes::CLI

	def call
		list_recipes
		menu
	end

	def list_recipes
		puts "------------------- Keto Recipes ------------------------".bold.blue
		@recipes = KetoRecipes::Scraper.today
		@recipes.each.with_index(1) do |recipe, i|
			puts "#{i}. #{recipe.name}".italic.magenta
		end
	end

	def menu
		puts "Please enter the number for the recipe you want to see: ".bold

		input = gets.strip.to_i
		if input <= 4 && input != 0
			print_details(input)
			repeat
		
		else
			puts "Not a valid entry, please try again....".italic.red
		end
		call
	end

	def repeat
		input = nil
		puts "-----------------------------------------------------------"
		puts "Would you like to see another recipe? Enter Y or N".bold
		
		input = gets.strip.downcase
		if input == "y"
			call
		elsif input == "n"
			puts "Thanks for stopping by!".bold.cyan
			exit
		else
			puts "-------------------------------------------------------------------"
			puts "Not a valid entry, please try again....".italic.red
		end
	end

	def print_details(input)
			the_recipe = @recipes[input-1]
			puts "#{the_recipe.name}:".bold.magenta
			puts "Ingredients:".bold.green
			puts "#{the_recipe.ingredients}".blue
			puts "Directions:".bold.green
			puts "#{the_recipe.directions}".blue
			puts "Print/URL:".bold.green
			puts "#{the_recipe.print_url}".blue
	end

end