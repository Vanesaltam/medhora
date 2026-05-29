class AddUserIdToPatients < ActiveRecord::Migration[8.1]
  def change
    add_column :patients, :user_id, :bigint
    add_index :patients, :user_id
    add_foreign_key :patients, :users
  end
end
