class Message < ApplicationRecord
  belongs_to :sender, class_name: :User
  belongs_to :recipient, class_name: :User

  scope :conversation, ->(user1, user2) {
          where(sender: user1).
            or(where(recipient: user1)).
            and(where(sender: user2).or(where(recipient: user2)))
        }
end
