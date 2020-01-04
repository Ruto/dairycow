require 'test_helper'

class CowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cow = cows(:one)
  end

  test "should get index" do
    get cows_url, as: :json
    assert_response :success
  end

  test "should create cow" do
    assert_difference('Cow.count') do
      post cows_url, params: { cow: { active: @cow.active, birth_by: @cow.birth_by, breed: @cow.breed, created_by: @cow.created_by, dairy_id: @cow.dairy_id, deactivation_reason: @cow.deactivation_reason, dob: @cow.dob, female: @cow.female, name: @cow.name, photo_id: @cow.photo_id } }, as: :json
    end

    assert_response 201
  end

  test "should show cow" do
    get cow_url(@cow), as: :json
    assert_response :success
  end

  test "should update cow" do
    patch cow_url(@cow), params: { cow: { active: @cow.active, birth_by: @cow.birth_by, breed: @cow.breed, created_by: @cow.created_by, dairy_id: @cow.dairy_id, deactivation_reason: @cow.deactivation_reason, dob: @cow.dob, female: @cow.female, name: @cow.name, photo_id: @cow.photo_id } }, as: :json
    assert_response 200
  end

  test "should destroy cow" do
    assert_difference('Cow.count', -1) do
      delete cow_url(@cow), as: :json
    end

    assert_response 204
  end
end
