class AiConsultation < ApplicationRecord
  belongs_to :patient

  has_many :appointments, dependent: :nullify
end
