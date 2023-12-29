require 'test_helper'

class GetApiHelloWorldTest < ActionDispatch::IntegrationTest
  test "適切なtokenがあればステータス200でアクセスできる" do
    get '/api/hello_world',
      headers: { 'token': users(:alice_has_token).token },
      as: :json
    assert_response 200
  end
  test "/api/hello_worldからjson形式て適切な文字列が取得できる" do
    get '/api/hello_world',
      headers: { 'token': users(:alice_has_token).token },
      as: :json
    res = JSON.parse(response.body)
    assert_equal(
        'Hello,World',
        res['message']
    )
  end
  test "tokenがなければトップページにリダイレクト" do
    get '/api/hello_world',
      # headers: { 'token': 'token' },
      as: :json
    assert_redirected_to root_url
  end
  test "tokenがマッチしなければトップページにリダイレクト" do
    get '/api/hello_world',
      headers: { 'token': 'no_existing_token' },
      as: :json
    assert_redirected_to root_url
  end
end