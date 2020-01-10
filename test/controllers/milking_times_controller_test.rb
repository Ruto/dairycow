require 'test_helper'

class MilkingTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @milking_time = milking_times(:one)
  end

  test "should get index" do
    get milking_times_url, as: :json
    assert_response :success
  end

  test "should create milking_time" do
    assert_difference('MilkingTime.count') do
      post milking_times_url, params: { milking_time: { active: @milking_time.active, created_by: @milking_time.created_by, deactivated_by: @milking_time.deactivated_by, first_milking: @milking_time.first_milking, fourth_milking: @milking_time.fourth_milking, milking_count: @milking_time.milking_count, milking_timeable_id: @milking_time.milking_timeable_id, milking_timeable_type: @milking_time.milking_timeable_type, second_milking: @milking_time.second_milking, third_milking: @milking_time.third_milking } }, as: :json
    end

    assert_response 201
  end

  test "should show milking_time" do
    get milking_time_url(@milking_time), as: :json
    assert_response :success
  end

  test "should update milking_time" do
    patch milking_time_url(@milking_time), params: { milking_time: { active: @milking_time.active, created_by: @milking_time.created_by, deactivated_by: @milking_time.deactivated_by, first_milking: @milking_time.first_milking, fourth_milking: @milking_time.fourth_milking, milking_count: @milking_time.milking_count, milking_timeable_id: @milking_time.milking_timeable_id, milking_timeable_type: @milking_time.milking_timeable_type, second_milking: @milking_time.second_milking, third_milking: @milking_time.third_milking } }, as: :json
    assert_response 200
  end

  test "should destroy milking_time" do
    assert_difference('MilkingTime.count', -1) do
      delete milking_time_url(@milking_time), as: :json
    end

    assert_response 204
  end
end
