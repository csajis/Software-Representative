require 'test_helper'

class VotationRtResultsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @votation_rt_result = votation_rt_results(:one)
    @voter = voters(:one)
    sign_in @voter
  end

  test "should get index" do
    get votation_rt_results_url
    assert_response :success
  end

  test "should get new" do
    get new_votation_rt_result_url
    assert_response :success
  end

  test "should create votation_rt_result" do
    assert_difference('VotationRtResult.count') do
      post votation_rt_results_url, params: { votation_rt_result: { temporal_result: @votation_rt_result.temporal_result, votation_id: @votation_rt_result.votation_id } }
    end

    assert_redirected_to votation_rt_result_url(VotationRtResult.last)
  end

  test "should show votation_rt_result" do
    get votation_rt_result_url(@votation_rt_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_votation_rt_result_url(@votation_rt_result)
    assert_response :success
  end

  test "should update votation_rt_result" do
    patch votation_rt_result_url(@votation_rt_result), params: { votation_rt_result: { temporal_result: @votation_rt_result.temporal_result, votation_id: @votation_rt_result.votation_id } }
    assert_redirected_to votation_rt_result_url(@votation_rt_result)
  end

  test "should destroy votation_rt_result" do
    assert_difference('VotationRtResult.count', -1) do
      delete votation_rt_result_url(@votation_rt_result)
    end

    assert_redirected_to votation_rt_results_url
  end
end
