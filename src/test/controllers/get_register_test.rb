require 'test_helper'
include Warden::Test::Helpers

class GetRegisterTest < ActionDispatch::IntegrationTest
  # 異常系のテスト
  test 'パスワードは大文字英字を含まなければ登録できない' do
    assert_no_difference 'User.count' do
      get '/register'
      @user = User.new(
          email: 'registration_example_user@gmail.com',
          password: 'password111111??!',
      )
      @user.save
    end
  end
  test 'パスワードは小文字英字を含まなければ登録できない' do
    assert_no_difference 'User.count' do
      get '/register'
      @user = User.new(
          email: 'registration_example_user@gmail.com',
          password: 'PASSWORD111111??!',
      )
      @user.save
    end
  end
  test 'パスワードは記号を含まなければ登録できない' do
    assert_no_difference 'User.count' do
      get '/register'
      @user = User.new(
          email: 'registration_example_user@gmail.com',
          password: 'Password111111111',
      )
      @user.save
    end
  end
  test 'パスワードは数字を含まなければ登録できない' do
    assert_no_difference 'User.count' do
      get '/register'
      @user = User.new(
          email: 'registration_example_user@gmail.com',
          password: 'Passwordaaaaaa??!',
      )
      @user.save
    end
  end
  test 'パスワードは16文字以下では登録できない' do
    assert_no_difference 'User.count' do
      get '/register'
      @user = User.new(
          email: 'registration_example_user@gmail.com',
          password: ('1' * 15),
      )
      @user.save
    end
  end
  test 'パスワードは20文字20文字以上では登録できない' do
    assert_no_difference 'User.count' do
      get '/register'
      @user = User.new(
          email: 'registration_example_user@gmail.com',
          password: ('1' * 21),
      )
      @user.save
    end
  end


  # 正常系のテスト
  test "ログインしていないと登録画面にリダイレクト" do
    get '/register'
    assert_redirected_to new_user_registration_url
  end
  test "ログインしているとトップページにリダイレクト" do
    Warden.test_mode!
    @user = users( :alice )
    login_as(@user, :scope => :user)
    get '/register'
    assert_redirected_to root_url
  end
  test "メールアドレスとパスワードを登録するとユーザーが１人増える" do
    assert_difference 'User.count', 1 do
      get '/register'
      @user = User.new(
          email: 'registration_example_user@gmail.com',
          password: 'Password111111??!',
      )
      @user.save
    end
  end
end