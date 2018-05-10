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
		recipes << self.scrape_keto_cupcakes
		#go to keto.mama, find recipe
		#extract properties
		#instatiante a recipe
		recipes
	end

	def self.scrape_keto_mama_pbc
		
		doc = Nokogiri::HTML(open("https://www.heyketomama.com/keto-peanut-butter-cheesecake-bites/"))
		recipe = self.new
		recipe.name = doc.search(".tasty-recipes-1663 h2").text.strip
		recipe.ingredients = doc.search(".tasty-recipe-ingredients").children.css("li").map {|line| line.text}.join("\n")
		recipe.directions = doc.search(".tasty-recipe-instructions").children.css("li").map {|line| line.text}.join("\n")
		recipe.print_url = doc.search("a.button").attr("href").value.strip
		#binding.pry
		recipe	
	end 

	def self.scrape_keto_mama_abf
		doc = Nokogiri::HTML(open("https://www.heyketomama.com/easy-almond-butter-fat-bombs/"))
		
		recipe = self.new
		recipe.name = doc.search(".tasty-recipes-1678 h2").text
		recipe.ingredients = doc.search(".tasty-recipe-ingredients").children.css("p").map {|line| line.text}.join("\n")
		recipe.directions = doc.search(".tasty-recipe-instructions").children.css("p").map {|line| line.text}.join("\n")
		recipe.print_url = doc.search("a.button").attr("href").value.strip
		#binding.pry
		recipe
	end

	def self.scrape_keto_cupcakes
		doc = Nokogiri::HTML(open("https://www.heyketomama.com/keto-coconut-flour-cupcakes/"))
		recipe = self.new
		recipe.name = doc.search(".tasty-recipes-2275 h2").text
		recipe.ingredients = doc.search(".tasty-recipe-ingredients").children.css("li").map {|line| line.text}.join("\n")
		recipe.directions = doc.search(".tasty-recipe-instructions").children.css("li").map {|line| line.text}.join("\n")
		recipe.print_url = doc.search("a.button").attr("href").value.strip
		#binding.pry
		recipe
	end
end
