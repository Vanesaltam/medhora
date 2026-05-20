class CreateMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.references :sender_user, null: false, foreign_key: { to_table: :users }
      t.text :content
      t.string :message_type
      t.boolean :read
      t.datetime :sent_at

      t.timestamps
    end
  end
end
