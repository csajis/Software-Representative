# frozen_string_literal: true

require 'test_helper'

# Test integracion para suscripciones
class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @subscription = subscriptions(:one)
    @voter = voters(:one)
    sign_in @voter
  end

  test 'should get index' do
    get subscriptions_url
    assert_response :success
  end

  test 'should get new' do
    get new_subscription_url
    assert_response :success
  end

  test 'should unsuscribe' do
    assert_difference('Subscription.count', -1) do
      post subscriptions_url, params: {
        subscription: {
          votation_id: @subscription.votation_id,
          voter_id: @subscription.voter_id
        }
      }
    end

    assert_redirected_to votation_url(@subscription.votation)
  end

  test 'should show subscription' do
    get subscription_url(@subscription)
    assert_response :success
  end

  test 'should get edit' do
    get edit_subscription_url(@subscription)
    assert_response :success
  end

  test 'should update subscription' do
    patch subscription_url(@subscription), params: {
      subscription: {
        votation_id: @subscription.votation_id,
        voter_id: @subscription.voter_id
      }
    }
    assert_redirected_to subscription_url(@subscription)
  end

  test 'should destroy subscription' do
    assert_difference('Subscription.count', -1) do
      delete subscription_url(@subscription)
    end

    assert_redirected_to subscriptions_url
  end
end
