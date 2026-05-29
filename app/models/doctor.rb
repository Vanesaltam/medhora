class Doctor < ApplicationRecord
  belongs_to :user

  has_many :chats, dependent: :destroy

  has_one_attached :medical_certificate

  attribute :status, :integer, default: 0
  enum :status, { pending: 0, approved: 1, rejected: 2 }

  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :specialty,       presence: true
  validates :license_number,  presence: true
  validates :medical_certificate, presence: { message: "debes subir tu título o diploma" }

  validate :certificate_must_be_pdf

  private

  def certificate_must_be_pdf
    return unless medical_certificate.attached?
    unless medical_certificate.content_type == "application/pdf"
      errors.add(:medical_certificate, "debe ser un archivo PDF")
    end
  end
end
