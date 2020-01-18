class User < ApplicationRecord
has_many :comments, foreign_key: :author_id, class_name: :Comment, dependent: :destroy

has_many :authored_stories, foreign_key: :author_id, class_name: :Story, dependent: :destroy

has_many :followed_users, foreign_key: :follower_id, class_name: :Following
has_many :followees, through: :followed_users

has_many :following_users, foreign_key: :followee_id, class_name: :Following
has_many :followers, through: :following_users

has_secure_password

 validates :name, presence: true
#  validates :name, length: { minimum: 2 }
 validates :email, presence: true
#  validates :email, confirmation: true
 validates :email, uniqueness: { case_sensitive: false }
#  validates :password_digest, length: { in: 6..20 }

# TODO add in has_many followings with their associations

    
end
