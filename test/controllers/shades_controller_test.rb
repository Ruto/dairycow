require 'test_helper'

class ShadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shade = shades(:one)
  end

  test "should get index" do
    get shades_url, as: :json
    assert_response :success
  end

  test "should create shade" do
    assert_difference('Shade.count') do
      post shades_url, params: { shade: { active: @shade.active, capacity: @shade.capacity, created_by: @shade.created_by, dairy_id: @shade.dairy_id, desc: @shade.desc, name: @shade.name } }, as: :json
    end

    assert_response 201
  end

  test "should show shade" do
    get shade_url(@shade), as: :json
    assert_response :success
  end

  test "should update shade" do
    patch shade_url(@shade), params: { shade: { active: @shade.active, capacity: @shade.capacity, created_by: @shade.created_by, dairy_id: @shade.dairy_id, desc: @shade.desc, name: @shade.name } }, as: :json
    assert_response 200
  end

  test "should destroy shade" do
    assert_difference('Shade.count', -1) do
      delete shade_url(@shade), as: :json
    end

    assert_response 204
  end
end
