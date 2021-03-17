class User < ApplicationRecord

  def self.conversations(user)
    user_ids = Message.where("sender_id = ? OR recipient_id = ?", user.id, user.id).pluck(:sender_id, :recipient_id).flatten.uniq
    User.where(id: user_ids).where.not(id: user.id)
  end
end
