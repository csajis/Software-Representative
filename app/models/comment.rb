# frozen_string_literal: true

# Modelo de comentario
class Comment < ApplicationRecord
  belongs_to :votation
  belongs_to :voter
end
