class CreateInstrumentals < ActiveRecord::Migration[6.0]
  def change
    create_table :instrumentals do |t|
      t.string :instrument
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
