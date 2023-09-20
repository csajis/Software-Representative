class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :FirstName, :string
    add_column :users, :MiddleName, :string
    add_column :users, :LastName, :string
    add_column :users, :SecondLastName, :string
    add_column :users, :BirthDate, :Date
  end
end
