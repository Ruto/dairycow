require 'test_helper'

class CowShadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cow_shade = cow_shades(:one)
  end

  test "should get index" do
    get cow_shades_url, as: :json
    assert_response :success
  end

  test "should create cow_shade" do
    assert_difference('CowShade.count') do
      post cow_shades_url, params: { cow_shade: { active: @cow_shade.active, cow_id: @cow_shade.cow_id, created_by: @cow_shade.created_by, deactivated_by: @cow_shade.deactivated_by, shade_id: @cow_shade.shade_id } }, as: :json
    end

    assert_response 201
  end

  test "should show cow_shade" do
    get cow_shade_url(@cow_shade), as: :json
    assert_response :success
  end

  test "should update cow_shade" do
    patch cow_shade_url(@cow_shade), params: { cow_shade: { active: @cow_shade.active, cow_id: @cow_shade.cow_id, created_by: @cow_shade.created_by, deactivated_by: @cow_shade.deactivated_by, shade_id: @cow_shade.shade_id } }, as: :json
    assert_response 200
  end

  test "should destroy cow_shade" do
    assert_difference('CowShade.count', -1) do
      delete cow_shade_url(@cow_shade), as: :json
    end

    assert_response 204
  end
end
