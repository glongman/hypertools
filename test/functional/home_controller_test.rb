require File.dirname(__FILE__) + '/../test_helper'
require 'home_controller'

# Re-raise errors caught by the controller.
class HomeController; def rescue_action(e) raise e end; end

class HomeControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "index went to setup first time" do
    User.delete_all
    get :index
    assert_redirected_to get_started_path
  end
  
  test "index goes home if logged in" do
    login_as(:quentin)
    get :index
    assert_redirected_to home_path
  end
  
  test "index_renders_after_setup" do
    get :index
    assert_response :success
  end
  
  test "home_not_logged_in" do
    get :home
    assert_redirected_to new_session_path
  end
  
  test "home logged in" do
    login_as(:quentin)
    get :home
    assert_response :success
  end
end
