class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :sender_user, class_name: "User", optional: true
end
