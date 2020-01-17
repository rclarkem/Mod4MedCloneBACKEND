class Story < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :author, class_name: 'User'

# TODO Add validations for title and body fields with minimum chars

#  TODO: Add Migration for images for stories table


end

