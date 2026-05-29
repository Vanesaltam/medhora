class Appointment < ApplicationRecord
  has_one :chat, dependent: :destroy
end
