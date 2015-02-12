require 'test_helper'

class GenereateUrlsControllerTest < ActionController::TestCase
  setup do
    @genereate_url = genereate_urls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:genereate_urls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create genereate_url" do
    assert_difference('GenereateUrl.count') do
      post :create, genereate_url: { url_name: @genereate_url.url_name }
    end

    assert_redirected_to genereate_url_path(assigns(:genereate_url))
  end

  test "should show genereate_url" do
    get :show, id: @genereate_url
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @genereate_url
    assert_response :success
  end

  test "should update genereate_url" do
    patch :update, id: @genereate_url, genereate_url: { url_name: @genereate_url.url_name }
    assert_redirected_to genereate_url_path(assigns(:genereate_url))
  end

  test "should destroy genereate_url" do
    assert_difference('GenereateUrl.count', -1) do
      delete :destroy, id: @genereate_url
    end

    assert_redirected_to genereate_urls_path
  end
end
