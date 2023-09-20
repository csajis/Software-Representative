require 'test_helper'

class SubAlertsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @sub_alert = sub_alerts(:one)
    @voter = voters(:one)
    sign_in @voter
  end

  test "should get index" do
    get sub_alerts_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_alert_url
    assert_response :success
  end

  test "should create sub_alert" do
    assert_difference('SubAlert.count') do
      post sub_alerts_url, params: { sub_alert: { notification_id: @sub_alert.notification_id, subscription_id: @sub_alert.subscription_id } }
    end

    assert_redirected_to sub_alert_url(SubAlert.last)
  end

  test "should show sub_alert" do
    get sub_alert_url(@sub_alert)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_alert_url(@sub_alert)
    assert_response :success
  end

  test "should update sub_alert" do
    patch sub_alert_url(@sub_alert), params: { sub_alert: { notification_id: @sub_alert.notification_id, subscription_id: @sub_alert.subscription_id } }
    assert_redirected_to sub_alert_url(@sub_alert)
  end

  test "should destroy sub_alert" do
    assert_difference('SubAlert.count', -1) do
      delete sub_alert_url(@sub_alert)
    end

    assert_redirected_to sub_alerts_url
  end
end
