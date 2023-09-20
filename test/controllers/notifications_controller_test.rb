# frozen_string_literal: true

require 'test_helper'

# Test de integracion para controlador de notificaciones
class NotificationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @notification = notifications(:one)
    @voter = voters(:one)
    sign_in @voter
  end

  test 'should get index' do
    get notifications_url
    assert_response :success
  end

  test 'should get new' do
    get new_notification_url
    assert_response :success
  end

  test 'should create notification' do
    assert_difference('Notification.count') do
      post notifications_url, params: { notification: { content: @notification.content } }
    end

    assert_redirected_to notification_url(Notification.last)
  end

  test 'should show notification' do
    get notification_url(@notification)
    assert_response :success
  end

  test 'should get edit' do
    get edit_notification_url(@notification)
    assert_response :success
  end

  test 'should update notification' do
    patch notification_url(@notification), params: {
      notification: {
        content: @notification.content
      }
    }
    assert_redirected_to notification_url(@notification)
  end

  test 'should destroy notification' do
    assert_difference('Notification.count', -1) do
      delete notification_url(@notification)
    end

    assert_redirected_to notifications_url
  end
end
