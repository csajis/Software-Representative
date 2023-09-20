class AddImgPathToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :imgpath, :string
  end
end
