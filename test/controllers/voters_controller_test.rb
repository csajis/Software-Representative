# frozen_string_literal: true

require 'test_helper'

# Clase para probar el controlador de votantes
class VotersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @voter = voters(:one)
    @voter = voters(:one)
    sign_in @voter
  end

  test 'should get index' do
    get voters_url
    assert_response :success
  end

  test 'should show voter' do
    get voter_url(@voter)
    assert_response :success
  end

  test 'should get edit' do
    get edit_voter_url(@voter)
    assert_response :success
  end

  # test 'should destroy voter' do
  #   assert_difference('Voter.count', -1) do
  #     delete voter_url(@voter)
  #   end

  #   assert_redirected_to voters_url
  # end
end
