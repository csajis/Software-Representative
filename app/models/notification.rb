# frozen_string_literal: true

# Modelo de notificaicon
class Notification < ApplicationRecord
  has_many :sub_alerts, dependent: :destroy
  has_many :subscriptions, through: :sub_alerts
end
