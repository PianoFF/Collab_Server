class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :street
      t.string :city_town
      t.string :state_province
      t.string :country
      t.string :post_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
