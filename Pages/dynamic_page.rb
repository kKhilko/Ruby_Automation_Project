require 'selenium-webdriver'
require 'capybara'
require 'pry'
require 'test/unit'
require 'sexy_settings'

class DynamicPage

  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def teardown
    @driver.quit
  end


########################################  Test Methods   #####################################

  def visit_to(url)
    @driver.navigate.to url
  end

  def page_reload
    @driver.navigate.refresh
  end

  def get_content
    content = {}
    content_r = "//*[@id='content']/*[@class ='row']"
    content_rows = @driver.find_elements(xpath:content_r)
    content_rows.each_index do |row|
      avatar = @driver.find_element(xpath:"#{content_r}[#{row+1}]//img").attribute('src')
      text = @driver.find_element(xpath:"#{content_r}[#{row+1}]//div[@class = 'large-10 columns']").text
      content["#{row+1}#{avatar}"] = text
    end
    content
  end

  def get_content_count
    @driver.find_elements(xpath:"//*[@id='content']/*[@class ='row']").length
  end
end