require 'selenium-webdriver'
require 'capybara'
require 'pry'
require 'test/unit'
require 'sexy_settings'
require_relative'../Pages/dynamic_page'



class TestDynamicContent < Test::Unit::TestCase

  def setup
    @page = DynamicPage.new
  end

  def test_validate_dynamic_content
    @page.visit_to('https://the-internet.herokuapp.com/dynamic_content')
    content_before = @page.get_content
    @page.page_reload
    content_after = @page.get_content
    assert(content_before != content_after)
  end

  def test_dynamic_content_count
    @page.visit_to('https://the-internet.herokuapp.com/dynamic_content')
    count_before = @page.get_content_count
    @page.page_reload
    count_after = @page.get_content_count
    assert(count_before == count_after)
  end

end