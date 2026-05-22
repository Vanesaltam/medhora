class CreateAiConsultations < ActiveRecord::Migration[8.1]
  def change
    create_table :ai_consultations do |t|
      t.references :patient, null: false, foreign_key: true
      t.text :symptoms
      t.text :ai_response
      t.string :suggested_specialty
      t.string :urgency_level

      t.timestamps
    end
  end
end
