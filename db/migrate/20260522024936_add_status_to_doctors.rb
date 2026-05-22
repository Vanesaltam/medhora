class AddStatusToDoctors < ActiveRecord::Migration[8.1]
  def change
    add_column :doctors, :status, :integer
  end
end
