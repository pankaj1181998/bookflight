require 'test_helper'

class BookControllerTest < ActionDispatch::IntegrationTest
  test "should get flight" do
    get book_flight_url
    assert_response :success
  end

end
