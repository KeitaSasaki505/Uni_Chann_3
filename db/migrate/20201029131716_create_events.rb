class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :genre_id, null: false
      t.integer :user_id, foreign_key: true
      t.text :overview, null: false
      t.text :project, null: false
      t.date :date, null: false
      t.string :address, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.timestamps
    end
  end
end
