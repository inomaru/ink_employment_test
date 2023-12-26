require 'test_helper'

class GetApiHelloWorldTest < ActionDispatch::IntegrationTest
  test "/api/hello_worldにステータス200でアクセスできる" do
    get '/api/hello_world'
    assert_response 200
  end
  test "/api/hello_worldからjson形式て適切な文字列が取得できる" do
    get '/api/hello_world'
    res = JSON.parse(response.body)
    assert_equal('Hello,World', res['message'])
  end
end