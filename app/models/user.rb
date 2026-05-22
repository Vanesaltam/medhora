class User < ApplicationRecord
  has_one :patient, dependent: :destroy
  has_one :doctor, dependent: :destroy
  has_many :messages, foreign_key: :sender_user_id, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
