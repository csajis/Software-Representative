class CreateModerations < ActiveRecord::Migration[5.1]
  def change
    create_table :moderations do |t|
      t.references :admin, foreign_key: { to_table: :users }
      t.references :votation, foreign_key: true

      t.timestamps
    end
  end
end
