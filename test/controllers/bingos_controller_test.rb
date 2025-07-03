require "test_helper"

class BingosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bingos_index_url
    assert_response :success
  end
end
