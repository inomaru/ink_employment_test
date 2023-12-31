require 'test_helper'

class GetHelloWorldTest < ActionDispatch::IntegrationTest
  test "hello_worldにアクセスできる" do
    get '/hello_world'
    assert_response :success
  end
  test "hello_worldに適切な文字列が表示されている" do
    get '/hello_world'
    assert_select"h1", {
      count: 1,
      text: 'Hello,World'
    }
  end
end