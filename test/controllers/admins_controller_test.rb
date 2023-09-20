# frozen_string_literal: true

require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = admins(:one)
    sign_in @admin
  end

  test 'should get index' do
    get admins_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_url
    assert_response :success
  end

  test 'should show admin' do
    get admin_url(@admin)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_url(@admin)
    assert_response :success
  end

  # test 'should update admin' do
  #   patch admin_url(@admin), params: { admin: {} }
  #   assert_redirected_to admin_url(@admin)
  # end

  test 'should destroy admin' do
    assert_difference('Admin.count', -1) do
      delete admin_url(@admin)
    end

    assert_redirected_to admins_url
  end
end
