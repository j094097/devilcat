require "test_helper"

class BingoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bingo_index_url
    assert_response :success
  end
end
