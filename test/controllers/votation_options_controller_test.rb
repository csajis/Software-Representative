require 'test_helper'

class VotationOptionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @votation_option = votation_options(:one)
    @voter = voters(:one)
    sign_in @voter
  end

  test "should get index" do
    get votation_options_url
    assert_response :success
  end

  test "should get new" do
    get new_votation_option_url
    assert_response :success
  end

  test "should create votation_option" do
    assert_difference('VotationOption.count') do
      post votation_options_url, params: { votation_option: { description: @votation_option.description, name: @votation_option.name, votation_id: @votation_option.votation_id } }
    end

    assert_redirected_to votation_option_url(VotationOption.last)
  end

  test "should show votation_option" do
    get votation_option_url(@votation_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_votation_option_url(@votation_option)
    assert_response :success
  end

  test "should update votation_option" do
    patch votation_option_url(@votation_option), params: { votation_option: { description: @votation_option.description, name: @votation_option.name, votation_id: @votation_option.votation_id } }
    assert_redirected_to votation_option_url(@votation_option)
  end

  test "should destroy votation_option" do
    assert_difference('VotationOption.count', -1) do
      delete votation_option_url(@votation_option)
    end

    assert_redirected_to votation_options_url
  end
end
