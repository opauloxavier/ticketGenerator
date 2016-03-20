require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get sucesso" do
    get :sucesso
    assert_response :success
  end

end
