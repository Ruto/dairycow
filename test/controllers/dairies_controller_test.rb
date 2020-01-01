require 'test_helper'

class DairiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dairy = dairies(:one)
  end

  test "should get index" do
    get dairies_url, as: :json
    assert_response :success
  end

  test "should create dairy" do
    assert_difference('Dairy.count') do
      post dairies_url, params: { dairy: { active: @dairy.active, country: @dairy.country, county: @dairy.county, desc: @dairy.desc, geolocation_id: @dairy.geolocation_id, name: @dairy.name, user_id: @dairy.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show dairy" do
    get dairy_url(@dairy), as: :json
    assert_response :success
  end

  test "should update dairy" do
    patch dairy_url(@dairy), params: { dairy: { active: @dairy.active, country: @dairy.country, county: @dairy.county, desc: @dairy.desc, geolocation_id: @dairy.geolocation_id, name: @dairy.name, user_id: @dairy.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy dairy" do
    assert_difference('Dairy.count', -1) do
      delete dairy_url(@dairy), as: :json
    end

    assert_response 204
  end
end
