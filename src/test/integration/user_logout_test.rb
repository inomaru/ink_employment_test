require "test_helper"
include Warden::Test::Helpers

class UserLogoutTest < ActionDispatch::IntegrationTest
  # 異常系のテスト
  # test 'パスワードは大文字英字を含まなければ登録できない' do
  # end


  # 正常系のテスト
  test "ログインユーザーが/logoutにアクセスするとログアウトできる" do
    Warden.test_mode!
    @user = users( :alice )
    login_as(@user, :scope => :user)
    post '/logout'
    assert_response :redirect
  end
end
