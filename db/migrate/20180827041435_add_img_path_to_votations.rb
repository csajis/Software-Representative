class AddImgPathToVotations < ActiveRecord::Migration[5.1]
  def change
    add_column :votations, :imgpath, :string
  end
end
