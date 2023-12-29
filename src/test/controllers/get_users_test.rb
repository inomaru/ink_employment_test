require 'test_helper'
include Warden::Test::Helpers

class GetUsersTest < ActionDispatch::IntegrationTest
  test "adminロールを持ったログインユーザーであればユーザーの一覧を表示できる" do
    Warden.test_mode!
    user = users( :alice )
    login_as(user, :scope => :user)
    get '/users'
    assert_select"tr.user-info", {
      # 40人分のユーザー情報
      count: 40
    }
  end
  test "adminロールを持たないログインユーザーはユーザー情報が表示されない" do
    Warden.test_mode!
    user = users( :snow )
    login_as(user, :scope => :user)
    get '/users'
    assert_select"tr.user-info", {
      count: 0
    }
  end
  test "adminロールを持つユーザーが初期状態で20人存在する" do
    Warden.test_mode!
    user = users( :alice )
    login_as(user, :scope => :user)
    get '/users'
    assert_select"td.have-admin-role", {
      count: 20
    }
  end
  test "userロールを持つユーザーが初期状態で20人存在する" do
    Warden.test_mode!
    user = users( :alice )
    login_as(user, :scope => :user)
    get '/users'
    assert_select"td.have-user-role", {
      count: 20
    }
  end
end