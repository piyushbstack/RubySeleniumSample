class Utilities

	require 'rubygems'
	require 'selenium-webdriver'

	attr_reader :driver

def initialize(url)
	caps = Selenium::WebDriver::Remote::Capabilities.new
	caps["os"] = "Windows"
	caps["os_version"] = "10"
	caps["browser"] = "Chrome"
	caps["browser_version"] = "83.0"
	caps["project"] = "sampleSelenium"	
	caps["build"] = "sampleTestAutomation"
	caps["name"] = "MyfirstProject"
	caps["browserstack.local"] = "false"
	caps["browserstack.selenium_version"] = "3.14.0"
	@driver = Selenium::WebDriver.for(:remote,
   		:url => "https://piyush2903:muE7pzp3b77ZZzZFPda7@hub-cloud.browserstack.com/wd/hub",
   		:desired_capabilities => caps)
	@driver.manage.window.maximize
	@driver.navigate.to url
end

def close_login_screen
	element = @driver.find_element(:xpath, "//button[contains(@class, '_29YdH8')]")
	element.click
	sleep(2)
end

def search_product(product_name)
	element = @driver.find_element(:name, 'q')
	element.send_keys "#{product_name}"
end

def submit
	element = @driver.find_element(:xpath, "//button[@type = 'submit']")
	element.click
	sleep(5)
end

def searchresult
	element = @driver.find_element(:class, '_2yAnYN')
	element.text
end

def close_driver
	@driver.quit
end
end
