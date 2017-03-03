class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, :class_name => "User"
    has_one :notification, as: :notifyable
    validate :disallow_self_referential_friendship

    def disallow_self_referential_friendship
        if friend_id == user_id
          errors.add(:friend_id, 'cannot refer back to the author')
        end
      end
end
