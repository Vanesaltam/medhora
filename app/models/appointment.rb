class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :ai_consultation, optional: true

  has_one :chat, dependent: :destroy
  has_one :review, dependent: :destroy
end
