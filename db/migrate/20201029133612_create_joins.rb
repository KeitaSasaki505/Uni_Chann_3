class CreateJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :joins do |t|
      t.integer :user_id, foreign_key: true
      t.integer :event_id, foreign_key: true
      t.string :name_kanji, null: false
      t.string :name_kana, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.text :message
      t.timestamps
    end
  end
end