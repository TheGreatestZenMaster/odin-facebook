class Like < ApplicationRecord
    belongs_to :liked_by_user, class_name: "User"
    belongs_to :liked_post, class_name: "Post"
    has_one :notification, as: :notifyable
end
