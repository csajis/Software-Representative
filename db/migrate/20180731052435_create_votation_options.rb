class CreateVotationOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :votation_options do |t|
      t.string :name
      t.string :description
      t.references :votation, foreign_key: true

      t.timestamps
    end
  end
end
