class KetoRecipes::Recipe 
	attr_accessor :name, :ingredients, :directions, :print_url
	
	def self.today
		#scrape for recipes

		self.scrape_recipes
	end



	def self.scrape_recipes
		recipes = []

		recipes << self.scrape_keto_mama_pbc
		recipes << self.scrape_keto_mama_abf
		#go to keto.mama, find recipe
		#extract properties
		#instatiante a recipe
		recipes
	end

	def self.scrape_keto_mama_pbc
		doc = Nokogiri::HTML(open("https://www.heyketomama.com/keto-peanut-butter-cheesecake-bites/"))
		recipe = self.new
		recipe.name = doc.search(".tasty-recipes-1663 h2").text
		recipe.ingredients = doc.search(".tasty-recipe-ingredients").children.css("li").text
		recipe.directions = doc.search(".tasty-recipe-instructions").children.css("li").text
		recipe.print_url = doc.search("a.button").attr("href").value
		
		recipe	
	end

	def self.scrape_keto_mama_abf
		doc = Nokogiri::HTML(open("https://www.heyketomama.com/easy-almond-butter-fat-bombs/"))
		
		recipe = self.new
		recipe.name = doc.search(".tasty-recipes-1678 h2").text
		recipe.ingredients = doc.search(".tasty-recipe-ingredients").children.css("p").text
		recipe.directions = doc.search(".tasty-recipe-instructions").children.css("p").text
		recipe.print_url = doc.search("a.button").attr("href").value
		#binding.pry
		recipe
	end
end

		# recipe_1 = self.new
		# recipe_1.name = "PB Cheesecake Bites" 
		# recipe_1.ingredients = "Ingredients"
		# recipe_1.directions = "Directions"
		# recipe_1.print_url = "print_url"

		# recipe_2 = self.new
		# recipe_2.name = "Almond Butter Fat Bombs" 
		# recipe_2.ingredients = "Ingredients"
		# recipe_2.directions = "Directions"
		# recipe_2.print_url = "print_url"