# frozen_string_literal: true

require 'test_helper'

# Test de controlador de votos
class VotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @vote = votes(:one)
    @voter = voters(:one)
    sign_in @voter
  end

  test 'should get index' do
    get votes_url
    assert_response :success
  end

  test 'should get new' do
    get new_vote_url
    assert_response :success
  end

  test 'should create vote' do
    assert_difference('Vote.count') do
      # byebug
      post votes_url, params: {
        vote: {
          votation_id: @vote.votation_id,
          votation_option_id: @vote.votation_option_id
        }
      }
    end

    assert_redirected_to vote_url(Vote.last)
  end

  test 'should show vote' do
    get vote_url(@vote)
    assert_response :success
  end

  test 'should get edit' do
    get edit_vote_url(@vote)
    assert_response :success
  end

  test 'should update vote' do
    patch vote_url(@vote), params: {
      vote: {
        votation_id: @vote.votation_id,
        votation_option_id: @vote.votation_option_id
      }
    }
    assert_redirected_to vote_url(@vote)
  end

  test 'should destroy vote' do
    assert_difference('Vote.count', -1) do
      delete vote_url(@vote)
    end

    assert_redirected_to votes_url
  end
end
