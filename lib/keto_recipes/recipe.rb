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
		recipe.name = doc.search(".tasty-recipes-1663 h2").text.strip
		# sdoc.css('.showing').each do |showing|
  # 		showing_id = showing['id'].split('_').last.to_i
  # 		tags = showing.css('.tags a').map { |tag| tag.text.strip }
		
		recipe.ingredients = doc.search('.tasty-recipe-ingredients').children.css('ul').each {|line|puts "#{line}"}
		recipe.directions = doc.search(".tasty-recipe-instructions").children.css(" li").text.strip
		recipe.print_url = doc.search("a.button").attr("href").value.strip
		#binding.pry
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
