class CreateVotationRtResults < ActiveRecord::Migration[5.1]
  def change
    create_table :votation_rt_results do |t|
      t.references :votation, foreign_key: true
      t.string :temporal_result

      t.timestamps
    end
  end
end
