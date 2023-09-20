class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :votation, foreign_key: true
      t.references :voter, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
