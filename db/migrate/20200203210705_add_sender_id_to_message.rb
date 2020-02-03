class AddSenderIdToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :sender_id, :integer
  end
end
