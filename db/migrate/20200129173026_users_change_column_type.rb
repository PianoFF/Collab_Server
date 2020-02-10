class UsersChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column(:users, :bio_content, :text)
  end
end
