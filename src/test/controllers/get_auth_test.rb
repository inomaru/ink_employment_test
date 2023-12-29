require 'test_helper'
include Warden::Test::Helpers

class GetAuthTest < ActionDispatch::IntegrationTest
  # アクセス
  test "ログイン済みのユーザーはアクセスに成功" do
    Warden.test_mode!
    @user = users( :alice )
    login_as(@user, :scope => :user)
    get '/auth'
    assert_response :success
  end
  test "未ログインユーザーはログイン画面にリダイレクト" do
    get '/auth'
    assert_redirected_to new_user_session_url
  end

  # ボタンの表示
  test "ログイン済みのユーザーにはトークン作成用ボタンが表示される" do
    Warden.test_mode!
    @user = users( :alice )
    login_as(@user, :scope => :user)
    get '/auth'
    assert_select"button", {
      count: 1,
      text: 'Token Generate'
    }
  end
end