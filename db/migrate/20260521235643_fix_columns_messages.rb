class FixColumnsMessages < ActiveRecord::Migration[8.1]
  def change
    remove_reference :messages, :sender_user, foreign_key: { to_table: :users }
    rename_column :messages, :message_type, :role
  end
end
