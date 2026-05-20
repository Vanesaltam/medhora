class CreateChats < ActiveRecord::Migration[8.1]
  def change
    create_table :chats do |t|
      t.references :appointment, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.string :status
      t.datetime :started_at
      t.datetime :closed_at

      t.timestamps
    end
  end
end
