class CreateVocals < ActiveRecord::Migration[6.0]
  def change
    create_table :vocals do |t|
      t.string :voice_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
