require 'test_helper'

class GetRootTest < ActionDispatch::IntegrationTest
  test "ルートパスにアクセスするとログイン画面にリダイレクト" do
    get '/'
    assert_redirected_to new_user_session_url
  end
end