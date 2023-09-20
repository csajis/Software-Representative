class AddVotationOptionToVote < ActiveRecord::Migration[5.1]
  def change
    add_reference :votes, :votation_option, foreign_key: true
  end
end
