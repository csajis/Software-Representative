class CreateVotations < ActiveRecord::Migration[5.1]
  def change
    create_table (:votations) do |t|
      t.string(:name)
      t.text(:description)
      t.boolean(:enabled)
      t.references(:owner, foreign_key: { to_table: :users })
      t.timestamps
    end
  end
end
