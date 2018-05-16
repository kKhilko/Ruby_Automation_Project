require 'selenium-webdriver'
require 'capybara'
require 'pry'
require 'test/unit'
require 'sexy_settings'
require_relative'../Pages/disappear_page'



class TestDisappearElement < Test::Unit::TestCase

  def setup
    @page = DisappearPage.new
  end

  def test_disappeared_element_count
    @page.visit_to('https://the-internet.herokuapp.com/disappearing_elements')
    tabs = @page.get_nav_menu_length
    @page.page_reload
    new_tabs = @page.get_nav_menu_length
    assert(tabs != new_tabs)
  end

  def test_disappeared_element_name
    @page.visit_to('https://the-internet.herokuapp.com/disappearing_elements')
    tabs = @page.get_nav_menu_length
    last = @page.get_last_tab_name
    if tabs < 5
      assert(last == 'Portfolio')
    else
      assert(last == 'Gallery')
    end
  end

end
