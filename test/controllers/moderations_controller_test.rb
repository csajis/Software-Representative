# frozen_string_literal: true

require 'test_helper'

# Test unitario para el controlador de Moderaciones
class ModerationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @moderation = moderations(:one)
    @voter = voters(:one)
    sign_in @voter
    # byebug
  end

  test 'should get index' do
    get moderations_url
    assert_response :success
  end

  test 'should get new' do
    get new_moderation_url
    assert_response :success
  end

  test 'should create moderation' do
    assert_difference('Moderation.count') do
      post moderations_url, params: {
        moderation: {
          admin_id: @moderation.admin_id,
          votation_id: @moderation.votation_id
        }
      }
    end

    assert_redirected_to moderation_url(Moderation.last)
  end

  test 'should show moderation' do
    get moderation_url(@moderation)
    assert_response :success
  end

  test 'should get edit' do
    get edit_moderation_url(@moderation)
    assert_response :success
  end

  test 'should update moderation' do
    patch moderation_url(@moderation), params: {
      moderation: {
        admin_id: @moderation.admin_id,
        votation_id: @moderation.votation_id
      }
    }
    assert_redirected_to moderation_url(@moderation)
  end

  test 'should destroy moderation' do
    assert_difference('Moderation.count', -1) do
      delete moderation_url(@moderation)
    end

    assert_redirected_to moderations_url
  end
end
