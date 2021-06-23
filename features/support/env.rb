require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'

browser = ENV['BROWSER']
ENVIRONMENT = YAML.load_file('./config/env.yml')

Capybara.configure do |config|
  browser = :selenium_chrome if browser.nil?
  config.default_driver = browser.to_sym
  config.default_max_wait_time = 10
end

Capybara.page.driver.browser.manage.window.maximize