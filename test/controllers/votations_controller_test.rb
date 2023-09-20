# frozen_string_literal: true

require 'test_helper'

# test de integracion para votationes
class VotationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @votation = votations(:votation_one)
    @voter = voters(:one)
    sign_in @voter
  end

  test 'should get index' do
    get votations_url
    assert_response :success
  end

  test 'should get new' do
    get new_votation_url
    assert_response :success
  end

  test 'should create votation' do
    assert_difference('Votation.count') do
      post votations_url, params: {
        votation: {
          description: @votation.description,
          enabled: @votation.enabled,
          name: @votation.name
        }
      }
    end

    assert_redirected_to votation_url(Votation.last)
  end

  test 'should show votation' do
    get votation_url(@votation)
    assert_response :success
  end

  test 'should get edit' do
    get edit_votation_url(@votation)
    assert_response :success
  end

  test 'should update votation' do
    patch votation_url(@votation), params: {
      votation: {
        description: @votation.description,
        enabled: @votation.enabled,
        name: @votation.name
      }
    }
    assert_redirected_to votation_url(@votation)
  end

  test 'should destroy votation' do
    assert_difference('Votation.count', -1) do
      delete votation_url(@votation)
    end

    assert_redirected_to votations_url
  end
end
