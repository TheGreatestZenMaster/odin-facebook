class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friends, :class_name => "User"
  has_many :notifications
  has_many :likes, foreign_key: "liked_by_user_id"
  has_many :liked_posts, through: :likes, source: :liked_by_user
  has_many :posts, foreign_key: "author_id"
  has_many :comments, foreign_key: "author_id"
  
  
    def like(apost)
       self.liked_posts << apost 
    end
    
    def unlike(apost)
       self.liked_posts.delete(apost) 
    end
  
end
