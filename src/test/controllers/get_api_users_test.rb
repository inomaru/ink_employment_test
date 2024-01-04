require 'test_helper'

class GetApiUsersTest < ActionDispatch::IntegrationTest
  test "adminロールを持つユーザーのtokenがあればユーザーの一覧をjsonで表示できる" do
    get '/api/users',
      headers: {
        'token': users(:alice).token
      },
      as: :json
    res = JSON.parse(response.body)
    assert_not_equal(
      {},
      res
    )
  end
  test "adminロールを持たないユーザーのtokenだと空のjsonが返される" do
    get '/api/users',
      headers: {
        'token': users(:snow).token
      },
      as: :json
    res = JSON.parse(response.body)
    assert_equal(
        {},
        res
    )
  end
end