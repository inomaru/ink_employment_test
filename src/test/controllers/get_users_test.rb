require 'test_helper'
include Warden::Test::Helpers

class GetUsersTest < ActionDispatch::IntegrationTest
  test "adminロールを持ったログインユーザーであればユーザーの一覧を表示できる" do
    Warden.test_mode!
    user = users( :alice )
    login_as(user, :scope => :user)
    get '/users'
    assert_select"td.user-info", {
      count: User.count*2
    }
  end
  test "adminロールを持たないログインユーザーはユーザー情報が表示されない" do
    Warden.test_mode!
    user = users( :non_admin_user )
    login_as(user, :scope => :user)
    get '/users'
    assert_select"td.user-info", {
      count: 0
    }
  end
end