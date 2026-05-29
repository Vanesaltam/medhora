class CreatePatients < ActiveRecord::Migration[8.1]
  def change
    create_table :patients do |t|
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
