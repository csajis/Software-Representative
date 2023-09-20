class AddStartDateToVotations < ActiveRecord::Migration[5.1]
  def change
    add_column :votations, :start_date, :datetime
  end
end
