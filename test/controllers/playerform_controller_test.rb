require 'test_helper'

class PlayerformControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get playerform_new_url
    assert_response :success
  end

end
