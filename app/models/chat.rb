class Chat < ApplicationRecord
  belongs_to :appointment
  belongs_to :patient
  belongs_to :doctor

  has_many :messages, dependent: :destroy
end
