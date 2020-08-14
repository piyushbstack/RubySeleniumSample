require_relative '../Utilities.rb'

Given ("navigate to flipkart") do
	@util = Utilities.new("https://www.flipkart.com/")
	@util.close_login_screen
end

When /^search for "(.+)" on home page$/ do |productName|
	@util.search_product productName
end

And ("submit the query") do
	@util.submit
end

Then /^search results should be displayed with "(.+)"$/ do |message|
	actual_message = @util.searchresult
	expect(actual_message).to include(message)
	@util.close_driver
end

