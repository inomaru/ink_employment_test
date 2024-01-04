require 'test_helper'
include Warden::Test::Helpers

class GetRegisterTest < ActionDispatch::IntegrationTest
  test 'ログインユーザーはログアウトできる' do
    Warden.test_mode!
    @user = users( :alice )
    login_as(@user, :scope => :user)
    get '/'
    assert_select "h1", {
      count: 1,
      text: 'Hello,World'
    }
    get '/logout'
    assert_select "h1", {
      count: 0,
      text: 'Hello,World'
    }
  end
end