class CreateIdentityDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :identity_docs do |t|
      t.string :run
      t.integer :doc_type
      t.string :doc_number
      t.timestamps
    end
  end
end
