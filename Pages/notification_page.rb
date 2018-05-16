require 'selenium-webdriver'
require 'capybara'
require 'pry'
require 'test/unit'
require 'sexy_settings'

class NotificationPage

  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def teardown
    @driver.quit
  end

  ########################################  Test Methods   #####################################

  def visit_to(url)
    @driver.navigate.to (url)
  end

  def click_message_render
    @driver.find_element(xpath:"//a[@href='/notification_message']").click
  end

  def get_message_element
    @driver.find_element(css:'#flash-messages')
  end

  def get_all_messages
    @driver.find_elements(css:'#flash_messages')
  end

  def get_message_text
    @driver.find_element(css:'#flash')
  end

  def close_message
    close = @driver.find_element(xpath:"//div/a[@class='close']")
    @driver.action.move_to(close).click.perform
  end

  def get_text_all_messages
    @driver.find_elements(css:'#flash')
  end
end