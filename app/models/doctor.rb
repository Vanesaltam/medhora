class Doctor < ApplicationRecord
  belongs_to :user

  has_many :appointments, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
