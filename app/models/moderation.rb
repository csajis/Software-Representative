# frozen_string_literal: true

# Modelo de moderacion
class Moderation < ApplicationRecord
  belongs_to :admin
  belongs_to :votation
end
