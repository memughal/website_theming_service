require 'test_helper'

class StylesheetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get stylesheets_new_url
    assert_response :success
  end

end
