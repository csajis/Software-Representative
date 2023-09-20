class CreateSubAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_alerts do |t|
      t.references :notification, foreign_key: true
      t.references :subscription, foreign_key: true

      t.timestamps
    end
  end
end
