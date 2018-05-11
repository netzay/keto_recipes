class KetoRecipes::Recipe 
	attr_accessor :name, :ingredients, :directions, :print_url
	
	def self.today
		self.scrape_recipes
	end

	def self.scrape_recipes
		recipes = []
		
		recipes << self.scrape_keto_mama_pbc
		recipes << self.scrape_keto_mama_abf
		recipes << self.scrape_keto_cupcakes
		recipes << self.scrape_keto_banana_muffins
		recipes << self.scrape_keto_protein_coffee
	
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

	def self.scrape_keto_banana_muffins
		doc = Nokogiri::HTML(open("https://www.heyketomama.com/keto-banana-nut-muffins/"))

		recipe = self.new
		recipe.name = doc.search(".tasty-recipes-2199 h2").text
		recipe.ingredients = doc.search(".tasty-recipe-ingredients").children.css("li").map {|line| line.text}.join("\n")
		recipe.directions = doc.search(".tasty-recipe-instructions").children.css("li").map {|line| line.text}.join("\n")
		recipe.print_url = doc.search("a.button").attr("href").value.strip
		#binding.pry
		recipe
	end

	def self.scrape_keto_protein_coffee
		doc = Nokogiri::HTML(open("https://www.heyketomama.com/easy-keto-protein-coffee/"))
		recipe = self.new
		recipe.name = doc.search(".tasty-recipes-1747 h2").text
		recipe.ingredients = doc.search(".tasty-recipe-ingredients").children.css("p").map {|line| line.text}.join("\n")
		recipe.directions = doc.search(".tasty-recipe-instructions").children.css("p").map {|line| line.text}.join("\n")
		recipe.print_url = doc.search("a.button").attr("href").value.strip
		#binding.pry
		recipe
	end



end
