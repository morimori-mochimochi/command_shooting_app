require "test_helper"

class GameSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get game_sessions_new_url
    assert_response :success
  end
end
