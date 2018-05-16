require 'selenium-webdriver'
require 'capybara'
require 'pry'
require 'test/unit'
require 'sexy_settings'
require_relative'../Pages/notification_page'



class TestNotification < Test::Unit::TestCase

  def setup
    @page = NotificationPage.new
  end

  def test_notification_present
    @page.visit_to('https://the-internet.herokuapp.com/notification_message_rendered')
    @page.click_message_render
    message = @page.get_message_element
    assert(message.displayed?)
  end

  def test_notification_not_present
    @page.visit_to('https://the-internet.herokuapp.com/notification_message_rendered')
    messages = @page.get_all_messages
    assert(messages.empty?)
  end

  def test_notification_text
    @page.visit_to('https://the-internet.herokuapp.com/notification_message_rendered')
    @page.click_message_render
    message_text = @page.get_message_text
    assert(message_text.text.include?('Action '))
  end

  def test_notification_close
    @page.visit_to('https://the-internet.herokuapp.com/notification_message_rendered')
    @page.click_message_render
    @page.close_message
    message_text = @page.get_text_all_messages
    assert(message_text.empty?)
  end

end

