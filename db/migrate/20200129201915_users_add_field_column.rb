class UsersAddFieldColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :field, :string
  end
end
