class CreateVotationResults < ActiveRecord::Migration[5.1]
  def change
    create_table :votation_results do |t|
      t.references :votation, foreign_key: true
      t.string :final_result

      t.timestamps
    end
  end
end
