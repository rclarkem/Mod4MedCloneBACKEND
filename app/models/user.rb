class User < ApplicationRecord
has_many :comments, foreign_key: :author_id, class_name: :Comment
has_many :authored_stories, foreign_key: :author_id, class_name: :Story

 validates :name, presence: true
 validates :name, length: { minimum: 2 }
 validates :email, presence: true
#  validates :email, confirmation: true
 validates :email, uniqueness: true
 validates :password_digest, length: { in: 6..20 }

# TODO add in has_many followings with their associations
# TODO: Create a user serializer 

    
end
