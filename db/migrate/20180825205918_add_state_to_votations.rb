class AddStateToVotations < ActiveRecord::Migration[5.1]
  def change
    add_column :votations, :state, :string
  end
end
