require 'test_helper'

class VotationResultsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @votation_result = votation_results(:one)
    @voter = voters(:one)
    sign_in @voter
  end

  test "should get index" do
    get votation_results_url
    assert_response :success
  end

  test "should get new" do
    get new_votation_result_url
    assert_response :success
  end

  test "should create votation_result" do
    assert_difference('VotationResult.count') do
      post votation_results_url, params: { votation_result: { final_result: @votation_result.final_result, votation_id: @votation_result.votation_id } }
    end

    assert_redirected_to votation_result_url(VotationResult.last)
  end

  test "should show votation_result" do
    get votation_result_url(@votation_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_votation_result_url(@votation_result)
    assert_response :success
  end

  test "should update votation_result" do
    patch votation_result_url(@votation_result), params: { votation_result: { final_result: @votation_result.final_result, votation_id: @votation_result.votation_id } }
    assert_redirected_to votation_result_url(@votation_result)
  end

  test "should destroy votation_result" do
    assert_difference('VotationResult.count', -1) do
      delete votation_result_url(@votation_result)
    end

    assert_redirected_to votation_results_url
  end
end
