class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :voter, foreign_key: { to_table: :users }
      t.references :votation, foreign_key: true

      t.timestamps
    end
  end
end
