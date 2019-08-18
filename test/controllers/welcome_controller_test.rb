require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test '#index - user not signed in' do
    get '/welcome/index'
    assert_response :success

    #verify view content
    assert_select 'h1.display-4', "Welcome to GLOBALPOST"
    assert_select 'a.nav-link', "Sign in"
    assert_select 'a.nav-link', "Sign up"
  end

  test '#index - user signed in' do
    user_email = 'test.user@mail.com'
    user = ::FactoryBot.create(:user, email: user_email)
    sign_in user
    get '/welcome/index'
    assert_response :redirect

    follow_redirect!

    # Verify view content
    assert_select 'h4', "Welcome #{user_email}"
    assert_select 'span.navbar-text', user_email
    assert_select 'a.nav-link', 'Sign out'
  end

  test '#faq' do
    get '/welcome/faq'
    assert_response :success
  end

  test '#features' do
    get '/welcome/features'
    assert_response :success
  end

  test '#about' do
    get '/welcome/about'
    assert_response :success
  end

end