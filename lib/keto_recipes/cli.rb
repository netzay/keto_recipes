class KetoRecipes::CLI

	def call
		list_recipes
		menu
	end

	def list_recipes
		puts "------------------- Keto Recipes ------------------------".bold.blue
		@recipes = KetoRecipes::Scraper.today
		@recipes.each.with_index(1) do |recipe, i|
			puts "#{i}. #{recipe.name}".italic.green
		end
	end

	def menu
		puts "Type the number of the recipe you want to see: ".italic.magenta
		input = gets.strip.to_i
		if input <= 4
			print_details(input)
			repeat
		else
			puts "Not a valid entry, please try again."
		end
		call
	end

	def repeat
		input = nil
		puts "-----------------------------------------------------------"
		puts "Would you like to see another recipe? Enter Y or N".italic.magenta
		
		input = gets.strip.downcase
		if input == "y"
			call
		elsif input == "n"
			puts "Thanks for stopping by!".bold.blue
			exit
		else
			puts "-------------------------------------------------------------------"
			puts "Hmmm....I don't know what you mean.".italic.red
		end
	end

	def print_details(input)
			the_recipe = @recipes[input-1]
			puts "#{the_recipe.name}:".bold
			puts "Ingredients:".bold 
			puts "#{the_recipe.ingredients}".blue
			puts "Directions:".bold
			puts "#{the_recipe.directions}".blue
			puts "Print/URL:".bold
			puts "#{the_recipe.print_url}".bold.green
	end

end