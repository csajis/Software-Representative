class RemoveenabledFromvotations < ActiveRecord::Migration[5.1]
  def change
    remove_column :votations, :enabled, :boolean
  end
end
