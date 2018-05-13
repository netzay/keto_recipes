Basic control flow - how "if" statements work
	The if statements are used to control the input from the user.  The logic directs and contains the input to follow the decision tree of typing in (only) a valid number for the menu method and only "y" or "no" for the repeat method. When incorrect values are entered an alert is shown and the list of recipes is shown until valid input is entered.

Variable scopes - method, instance and class
	Cli class methods:
	call: calls list_recipe method and menu method for each call made

	list_recipes: creates instances of recipe objects by calling the scraper class where sites are scraped and new objects are created for each recipe.

	menu: Asks which recipe user would like to view, input goes through if statement for validity check then sent to the print_details method, then the repeat method is called

	repeat: Asks if user would like to view another recipe, repeats another call, exits if not. 

	print_details: Based on the input collected in the menu method, the selected recipe object's information is printed.

	Scraper class:
	class method self.today, called by class method self.scrape_recipes which contains the array of recipe objects created by each of the following scrape methods gathering the recipe information.

Object instantiation - #new (and possibly #initialize)
	-each scrape method creates a new recipe instance and the properties are initialized witha attr_accessor 
The meaning of the "self" keyword:
	-self is a reference to the class itself

Method types - class vs. instance methods
	-class methods are used when they can not be called or used on an instance of the class.
	-instance methods are used when and on an instance of the class.
Method return types - knowing what methods return:
	-scrape methods return a recipe object 
Iterating through collections - at least using #each with a block:
	-List_recipes by index