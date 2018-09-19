require 'test_helper'

class PrivacyControllerTest < ActionDispatch::IntegrationTest
  test "should get policy" do
    get privacy_policy_url
    assert_response :success
  end

end
