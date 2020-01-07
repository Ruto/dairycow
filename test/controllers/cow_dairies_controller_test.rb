require 'test_helper'

class CowDairiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cow_dairy = cow_dairies(:one)
  end

  test "should get index" do
    get cow_dairies_url, as: :json
    assert_response :success
  end

  test "should create cow_dairy" do
    assert_difference('CowDairy.count') do
      post cow_dairies_url, params: { cow_dairy: { active: @cow_dairy.active, cow_id: @cow_dairy.cow_id, dairy_id: @cow_dairy.dairy_id, user_id: @cow_dairy.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show cow_dairy" do
    get cow_dairy_url(@cow_dairy), as: :json
    assert_response :success
  end

  test "should update cow_dairy" do
    patch cow_dairy_url(@cow_dairy), params: { cow_dairy: { active: @cow_dairy.active, cow_id: @cow_dairy.cow_id, dairy_id: @cow_dairy.dairy_id, user_id: @cow_dairy.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy cow_dairy" do
    assert_difference('CowDairy.count', -1) do
      delete cow_dairy_url(@cow_dairy), as: :json
    end

    assert_response 204
  end
end
