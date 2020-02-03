class AddUserToMessage < ActiveRecord::Migration[6.0]
  def change
    # add_reference :messages, :users, null: false, foreign_key: true
    # add_column :messages, :sender, :integer
    add_column :messages, :sender_id, :integer
    add_column :messages, :recipient_id, :integer
  end
end
