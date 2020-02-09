class AddReceiverDeleteColumnToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :receiver_delete, :boolean, :default => false
  end
end
