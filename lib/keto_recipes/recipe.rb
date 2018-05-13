class KetoRecipes::Recipe
	attr_accessor :name, :ingredients, :directions, :print_url

	@@all = []

	def initialize(name = nil, ingredients=nil, directions=nil, print_url=nil)
		@name = name
		@ingredients = ingredients
		@directions = directions
		@print_url = print_url
	@@all << self
	end

	def self.all
		@@all 
	end

	def self.find(id)
    	self.all[id-1]
  	end


end
