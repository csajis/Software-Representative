# frozen_string_literal: true

# Modelo de adminsitrador
class Admin < User
  has_many :moderations, dependent: :nullify
  has_many :moderated_votations, through: :moderations, source: :votation
end
