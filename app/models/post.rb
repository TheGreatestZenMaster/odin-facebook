class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments
  
  has_many :likes, foreign_key: "liked_post_id"
  has_many :liked_by_users, :through => :likes, :source => :user
  validates :content, presence: true, length: { maximum: 500}
  
  
  def liked_by_user?(user)
    self.likes.any? {|x| x.liked_by_user_id == user.id }
  end
end
