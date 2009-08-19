require File.dirname(__FILE__) + '/../test_helper'
require 'users_controller'

# Re-raise errors caught by the controller.
class UsersController; def rescue_action(e) raise e end; end

class UsersControllerTest < ActionController::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead
  # Then, you can remove it from this and the units test.
  include AuthenticatedTestHelper

  fixtures :users
  
  def test_redirect_if_user_already_exists_on_create
    assert_no_difference 'User.count' do
      create_user
      assert_redirected_to unauthorized_sessions_url
    end
  end
  
  def test_redirect_if_user_already_exists_on_new
    assert_no_difference 'User.count' do
      get :new
      assert_redirected_to unauthorized_sessions_url
    end
  end

  def test_should_allow_signup
    User.delete_all
    assert_difference 'User.count' do
      create_user
      assert_response :redirect
    end
  end

  def test_should_require_login_on_signup
    User.delete_all
    assert_no_difference 'User.count' do
      create_user(:login => nil)
      assert_response :success
      assert assigns(:user).errors.on(:login)
    end
  end

  def test_should_require_password_on_signup
    User.delete_all
    assert_no_difference 'User.count' do
      create_user(:password => nil)
      assert_response :success
      assert assigns(:user).errors.on(:password)
    end
  end

  def test_should_require_password_confirmation_on_signup
    User.delete_all
    assert_no_difference 'User.count' do
      create_user(:password_confirmation => nil)
      assert_response :success
      assert assigns(:user).errors.on(:password_confirmation)
    end
  end

  def test_should_require_email_on_signup
    User.delete_all
    assert_no_difference 'User.count' do
      create_user(:email => nil)
      assert_response :success
      assert assigns(:user).errors.on(:email)
    end
  end
  
  protected
    def create_user(options = {})
      post :create, :user => { :login => 'quire', :name => 'Squire of Gothos', :email => 'quire@example.com',
        :password => 'quire69', :password_confirmation => 'quire69' }.merge(options)
    end
end
