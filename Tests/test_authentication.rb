require 'selenium-webdriver'
require 'capybara'
require 'pry'
require 'test/unit'
require 'sexy_settings'
require_relative'../Pages/authentication_page'



class TestAuthentication < Test::Unit::TestCase

  def setup
    @page = AuthenticationPage.new
  end

  def test_auth_exist
    @page.visit_to('https://the-internet.herokuapp.com/login')
    @page.login(@page.get_valid_username, @page.get_valid_password)
    logged_message = @page.get_auth_message
    assert(logged_message.displayed?)
  end

  def test_auth_logged
    @page.visit_to('https://the-internet.herokuapp.com/login')
    @page.login(@page.get_valid_username, @page.get_valid_password)
    success_message = @page.get_auth_success_message
    assert(success_message.include?('You logged into a secure area!'))
  end

  def test_auth_invalid_user
    @page.visit_to('https://the-internet.herokuapp.com/login')
    @page.login(@page.get_random_gen_credentials, @page.get_valid_password)
    error_message = @page.get_auth_error_message
    assert(error_message.include?('username is invalid'))
  end

  def test_auth_invalid_pwd
    @page.visit_to('https://the-internet.herokuapp.com/login')
    @page.login(@page.get_valid_username, @page.get_random_gen_credentials)
    error_message = @page.get_auth_error_message
    assert(error_message.include?('password is invalid'))
  end
end