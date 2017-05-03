require 'test_helper'

class LocalitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @locality = localities(:one)
  end

  test "should get index" do
    get localities_url
    assert_response :success
  end

  test "should get new" do
    get new_locality_url
    assert_response :success
  end

  test "should create locality" do
    assert_difference('Locality.count') do
      post localities_url, params: { locality: { name: @locality.name } }
    end

    assert_redirected_to locality_url(Locality.last)
  end

  test "should show locality" do
    get locality_url(@locality)
    assert_response :success
  end

  test "should get edit" do
    get edit_locality_url(@locality)
    assert_response :success
  end

  test "should update locality" do
    patch locality_url(@locality), params: { locality: { name: @locality.name } }
    assert_redirected_to locality_url(@locality)
  end

  test "should destroy locality" do
    assert_difference('Locality.count', -1) do
      delete locality_url(@locality)
    end

    assert_redirected_to localities_url
  end
end
