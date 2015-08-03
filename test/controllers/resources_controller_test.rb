require 'test_helper'

class ResourcesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get configure" do
    get :configure
    assert_response :success
  end

end
