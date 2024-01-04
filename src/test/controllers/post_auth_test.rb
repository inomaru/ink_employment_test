require 'test_helper'
include Warden::Test::Helpers

class PostAuthTest < ActionDispatch::IntegrationTest
  test "ログイン済みのユーザーはトークンを発行できる" do
    Warden.test_mode!
    user = users( :user_1 )
    login_as(user, :scope => :user)
    assert_empty(user.token)
    post '/auth'
    assert_not_empty(user.token)
  end
  test "トークンを発行するとトークンが表示される" do
    Warden.test_mode!
    user = users( :alice )
    login_as(user, :scope => :user)
    post '/auth'
    assert_select"p#generated_token", {
      count: 1,
    }
  end
end