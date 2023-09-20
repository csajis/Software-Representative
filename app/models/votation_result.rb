class VotationResult < ApplicationRecord
  belongs_to :votation

  serialize :final_result, Hash

  scope :results, -> (votation) {
    where(votation_id: votation).group(:option_id).count
  }

end
