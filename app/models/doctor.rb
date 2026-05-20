class Doctor < ApplicationRecord
  belongs_to :user, optional: true

  #has_many :appointments, dependent: :destroy
  has_many :chats, dependent: :nullify
  #has_many :reviews, dependent: :destroy
end
