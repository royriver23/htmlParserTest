require 'test_helper'

class ParsedSitesControllerTest < ActionController::TestCase
  setup do
    @parsed_site = parsed_sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parsed_sites)
  end

  test "should create parsed_site" do
    assert_difference('ParsedSite.count') do
      post :create, parsed_site: { name: @parsed_site.name, url: @parsed_site.url }
    end

    assert_response 201
  end

  test "should show parsed_site" do
    get :show, id: @parsed_site
    assert_response :success
  end

  test "should update parsed_site" do
    put :update, id: @parsed_site, parsed_site: { name: @parsed_site.name, url: @parsed_site.url }
    assert_response 204
  end

  test "should destroy parsed_site" do
    assert_difference('ParsedSite.count', -1) do
      delete :destroy, id: @parsed_site
    end

    assert_response 204
  end
end
