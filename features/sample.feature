Feature: Flipkart product search


Scenario Outline: Search and verify product
	Given navigate to flipkart
	When search for "<Product>" on home page
	And submit the query
	Then search results should be displayed with "<message>"

	Examples:
	|Product||message|
	|ROG 3||results for "ROG 3"|
	|Mobile||results for "Mobile"|