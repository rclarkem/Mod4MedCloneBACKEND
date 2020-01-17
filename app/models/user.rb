class User < ApplicationRecord
has_many :comments, foreign_key: :author_id, class_name: :Comment, dependent: :destroy

has_many :authored_stories, foreign_key: :author_id, class_name: :Story, dependent: :destroy

has_secure_password

 validates :name, presence: true
#  validates :name, length: { minimum: 2 }
 validates :email, presence: true
#  validates :email, confirmation: true
 validates :email, uniqueness: { case_sensitive: false }
#  validates :password_digest, length: { in: 6..20 }

# TODO add in has_many followings with their associations

    
end
