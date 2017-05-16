require 'test_helper'

class StreetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @street = streets(:one)
  end

  test "should get index" do
    get streets_url
    assert_response :success
  end

  test "should get new" do
    get new_street_url
    assert_response :success
  end

  test "should create street" do
    assert_difference('Street.count') do
      post streets_url, params: { street: { localities: @street.localities, name: @street.name } }
    end

    assert_redirected_to street_url(Street.last)
  end

  test "should show street" do
    get street_url(@street)
    assert_response :success
  end

  test "should get edit" do
    get edit_street_url(@street)
    assert_response :success
  end

  test "should update street" do
    patch street_url(@street), params: { street: { localities: @street.localities, name: @street.name } }
    assert_redirected_to street_url(@street)
  end

  test "should destroy street" do
    assert_difference('Street.count', -1) do
      delete street_url(@street)
    end

    assert_redirected_to streets_url
  end
end
