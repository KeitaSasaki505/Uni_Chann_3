class CreateJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :joins do |t|
      t.references :user_id
      t.references :event_id
      t.string :name_kanji, null: false
      t.string :name_kana, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.text :message
      t.timestamps
    end
  end
end