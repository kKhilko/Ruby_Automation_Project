require 'selenium-webdriver'
require 'capybara'
require 'pry'
require 'test/unit'
require 'sexy_settings'

class HoverPage

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

  def get_all_figures
    @hover = "//div[@class='figure']"
    @driver.find_elements(xpath:@hover)
  end

  def hovering(i)
    element = @driver.find_element(xpath:"#{@hover}[#{i}]")
    @driver.action.move_to(element).perform
  end

  def get_figure_name_by_index(i)
    @driver.find_element(xpath:"#{@hover}[#{i}]//h5")
  end

  def get_link_attribute_by_index(i)
    @driver.find_element(xpath:"#{@hover}[#{i}]//a").attribute('href')
  end
end