require 'selenium-webdriver'
require 'capybara'
require 'pry'
require 'test/unit'
require 'sexy_settings'

class DisappearPage

  def initialize
    @dr = Selenium::WebDriver.for :chrome
  end

  def teardown
    @dr.quit
  end


  ########################################  Test Methods   #####################################

  def get_nav_menu_length
    @dr.find_elements(xpath:'//li/a').length
  end

  def visit_to(url_extantion)
    @dr.navigate.to (url_extantion)
  end

  def page_reload
    sleep 3
    @dr.navigate.refresh
  end

  def get_last_tab_name
    @dr.find_elements(xpath:'//li/a').last.text
  end
end