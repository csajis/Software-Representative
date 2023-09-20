class AddIdentityDocToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :identity_doc, foreign_key: true
  end
end
