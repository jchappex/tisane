require 'test_helper'

class ShowcaseControllerTest < ActionController::TestCase
  test "should get Idea" do
    get :Idea
    assert_response :success
  end

  test "should get Legend" do
    get :Legend
    assert_response :success
  end

end
