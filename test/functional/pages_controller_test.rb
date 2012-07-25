require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page)
  end
  
  test "should show page" do
    @page = pages(:one)
    get :show, :id => @page.id
    assert_response :success
    assert_not_nil assigns(:page)
  end
end
