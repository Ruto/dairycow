require 'test_helper'

class MilkingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @milking = milkings(:one)
  end

  test "should get index" do
    get milkings_url, as: :json
    assert_response :success
  end

  test "should create milking" do
    assert_difference('Milking.count') do
      post milkings_url, params: { milking: { confirmed_by: @milking.confirmed_by, cow_id: @milking.cow_id, milked_by: @milking.milked_by, milking_time_id: @milking.milking_time_id, quantity: @milking.quantity, type: @milking.type } }, as: :json
    end

    assert_response 201
  end

  test "should show milking" do
    get milking_url(@milking), as: :json
    assert_response :success
  end

  test "should update milking" do
    patch milking_url(@milking), params: { milking: { confirmed_by: @milking.confirmed_by, cow_id: @milking.cow_id, milked_by: @milking.milked_by, milking_time_id: @milking.milking_time_id, quantity: @milking.quantity, type: @milking.type } }, as: :json
    assert_response 200
  end

  test "should destroy milking" do
    assert_difference('Milking.count', -1) do
      delete milking_url(@milking), as: :json
    end

    assert_response 204
  end
end
