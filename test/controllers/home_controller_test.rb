require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get LinguistInformation" do
    get home_LinguistInformation_url
    assert_response :success
  end

end
