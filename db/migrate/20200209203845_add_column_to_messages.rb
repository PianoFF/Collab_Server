class AddColumnToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :sender_delete, :boolean, :default => false
  end
end
