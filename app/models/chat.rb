class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, optional: true
  belongs_to :patient, optional: true
  belongs_to :appointment, optional: true
  
  has_many :messages, dependent: :destroy
end
