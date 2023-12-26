require 'test_helper'
include Warden::Test::Helpers

class GetHelloWorldTest < ActionDispatch::IntegrationTest
  # 異常系のテスト
  test "hello_worldにはログインしていなければリダイレクトされる" do
    get '/hello_world'
    assert_response :redirect
  end

  # 正常系のテスト
  test "hello_worldにはログインユーザーのみアクセスできる" do
    Warden.test_mode!
    @user = users( :alice )
    login_as(@user, :scope => :user)
    get '/hello_world'
    assert_response :success
  end
  test "hello_worldに適切な文字列が表示されている" do
    Warden.test_mode!
    @user = users( :alice )
    login_as(@user, :scope => :user)
    get '/hello_world'
    assert_select"h1", {
      count: 1,
      text: 'Hello,World'
    }
  end
end