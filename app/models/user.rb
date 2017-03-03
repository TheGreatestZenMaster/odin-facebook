class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friendships 
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :notifications
  
  has_many :sent_notifications, class_name: "Notification", foreign_key: "notify_from_id"
  has_many :recieved_notifications, class_name: "Notification", foreign_key: "notify_id"
  
  has_many :notify_from, through: :notifications, source: :notify_from
  has_many :notify, through: :notifications, source: :notify
  
  has_many :likes, foreign_key: "liked_by_user_id"
  has_many :liked_posts, through: :likes, source: :liked_by_user
  has_many :posts, foreign_key: "author_id"
  has_many :comments, foreign_key: "author_id"
  

      def feed
        #inverse_friends = "SELECT user_id FROM friendships
                          #  WHERE user_id = user_id"

        friendships = Friendship.where('user_id =? OR friend_id=?', self.id, self.id)
        friends = friendships.collect { |x| x.user_id}
        
        Post.where("author_id = ? OR author_id IN (?)", self.id, friends)
      end
  
end
