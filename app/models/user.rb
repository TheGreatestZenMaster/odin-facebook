class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :friends, :class_name => "User"
  has_many :notifications
  has_many :posts, foreign_key: "author_id"
  has_many :comments, foreign_key: "author_id"
end
