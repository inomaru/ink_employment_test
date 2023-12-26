require "test_helper"
include Warden::Test::Helpers

class AuthGeneratingTest < ActionDispatch::IntegrationTest
  # 異常系のテスト
  test "ログインしていなけれなトークン作成用の画面にアクセスできない" do
    get '/auth'
    assert_response :redirect
  end

  # 正常系のテスト
  test "ログイン済みのユーザーにはトークン作成用の画面にアクセスできる" do
    Warden.test_mode!
    @user = users( :alice )
    login_as(@user, :scope => :user)
    get '/auth'
    assert_response :success
  end
  test "ログイン済みのユーザーにはトークン作成用のボタンが表示される" do
    Warden.test_mode!
    @user = users( :alice )
    login_as(@user, :scope => :user)
    get '/auth'
    assert_select "button",
      text: 'Token Generate',
      count: 1
  end
  test "ログイン済みのユーザーはデフォルトではトークンを持たない" do
    Warden.test_mode!
    @user = users( :alice )
    login_as(@user, :scope => :user)
    assert_equal true, @user.token.empty?
  end
  test "ログイン済みのユーザーはトークンを作成できる" do
    Warden.test_mode!
    @user = users( :alice )
    login_as(@user, :scope => :user)
    post '/auth'
    assert_equal false, @user.token.empty?
  end
end
