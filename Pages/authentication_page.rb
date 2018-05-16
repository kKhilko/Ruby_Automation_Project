require 'selenium-webdriver'
require 'capybara'
require 'pry'
require 'test/unit'
require 'sexy_settings'
require_relative '../config/Initializers/settings'

class AuthenticationPage

  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def teardown
    @driver.quit
  end

  def settings
    SexySettings::Base.instance
  end

  ########################################  Test Methods   #####################################

  def visit_to(url)
    @driver.navigate.to (url)
  end

  def login(username, password)
    @driver.find_element(css:'#username').send_keys(username)
    @driver.find_element(css:'#password').send_keys(password)
    @driver.find_element(css:'.radius').click
  end

  def get_auth_message
    @driver.find_element(css:'#flash-messages')
  end

  def get_auth_success_message
    wait = Selenium::WebDriver::Wait.new(:timeout => 20)
    wait.until{@driver.find_element(css:'.flash.success').text}
  end

  def get_auth_error_message
    @driver.find_element(css:'.flash.error').text
  end
end