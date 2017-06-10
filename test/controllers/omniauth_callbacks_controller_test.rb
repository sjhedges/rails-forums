require 'test_helper'

class OmniauthCallbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get omniauth_callbacks_index_url
    assert_response :success
  end

end
