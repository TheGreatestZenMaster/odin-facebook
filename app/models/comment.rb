class Comment < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post
  has_many :notifications, as: :notifyable
  validates :content, presence: true, length: { maximum: 150}
end
