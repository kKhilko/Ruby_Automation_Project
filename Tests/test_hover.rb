require 'selenium-webdriver'
require 'capybara'
require 'pry'
require 'test/unit'
require 'sexy_settings'
require_relative'../Pages/hover_page'



class TestHover < Test::Unit::TestCase

  def setup
    @page = HoverPage.new
  end

  def test_figure_name_by_hover
    @page.visit_to 'https://the-internet.herokuapp.com/hovers'
    hovers = @page.get_all_figures
    hovers.each_index do |i|
      idx = i+1
      @page.hovering(idx)
      hover_name = @page.get_figure_name_by_index(idx)
      assert(hover_name.text.include?("user#{idx}"))
    end
  end

  def test_figure_link_by_hover
    @page.visit_to 'https://the-internet.herokuapp.com/hovers'
    hovers = @page.get_all_figures
    hovers.each_index do |i|
      idx = i+1
      @page.hovering(idx)
      hover_link = @page.get_link_attribute_by_index(idx)
      assert (hover_link.include?("/users/#{idx}"))
    end
  end
end