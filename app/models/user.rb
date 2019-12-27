class User < ApplicationRecord
has_many :comments, foreign_key: :author_id, class_name: :Comment
has_many :authored_stories, foreign_key: :author_id, class_name: :Story

# TODO add in has_many followings with their associations

    
end
