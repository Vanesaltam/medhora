class AddColumnsToDoctors < ActiveRecord::Migration[8.1]
  def change
    add_column :doctors, :first_name, :string
    add_column :doctors, :last_name, :string
    add_column :doctors, :photo_url, :string
    add_column :doctors, :specialty, :string
    add_column :doctors, :license_number, :string
    add_column :doctors, :consultation_price, :integer
    add_column :doctors, :available, :boolean, default: true
    add_reference :doctors, :user, foreign_key: true
  end
end
