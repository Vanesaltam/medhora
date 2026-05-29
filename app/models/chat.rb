class Chat < ApplicationRecord
  acts_as_chat

  belongs_to :patient
  has_many :chats, dependent: :destroy
end
