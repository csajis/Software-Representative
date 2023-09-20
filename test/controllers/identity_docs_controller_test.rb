require 'test_helper'

class IdentityDocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @identity_doc = identity_docs(:one)
  end

  test "should get index" do
    get identity_docs_url
    assert_response :success
  end

  test "should get new" do
    get new_identity_doc_url
    assert_response :success
  end

  test "should create identity_doc" do
    assert_difference('IdentityDoc.count') do
      post identity_docs_url, params: { identity_doc: { doc_number: @identity_doc.doc_number, doc_type: @identity_doc.doc_type, run: @identity_doc.run } }
    end

    assert_redirected_to identity_doc_url(IdentityDoc.last)
  end

  test "should show identity_doc" do
    get identity_doc_url(@identity_doc)
    assert_response :success
  end

  test "should get edit" do
    get edit_identity_doc_url(@identity_doc)
    assert_response :success
  end

  test "should update identity_doc" do
    patch identity_doc_url(@identity_doc), params: { identity_doc: { doc_number: @identity_doc.doc_number, doc_type: @identity_doc.doc_type, run: @identity_doc.run } }
    assert_redirected_to identity_doc_url(@identity_doc)
  end

  test "should destroy identity_doc" do
    assert_difference('IdentityDoc.count', -1) do
      delete identity_doc_url(@identity_doc)
    end

    assert_redirected_to identity_docs_url
  end
end
