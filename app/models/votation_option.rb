# frozen_string_literal: true

# Clase que describe las opciones de una votacion
class VotationOption < ApplicationRecord
  belongs_to :votation
  has_many :votes, dependent: :nullify
end
