# frozen_string_literal: true

# Modelo de subscription
class Subscription < ApplicationRecord
  belongs_to :voter
  belongs_to :votation
  has_many :sub_alerts, dependent: :destroy
  has_many :notifications, through: :sub_alerts

  scope :own_subscriptions, -> (user){
    where(voter_id: user)
  }
end
