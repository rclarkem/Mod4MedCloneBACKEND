class Story < ApplicationRecord
    has_many :comments
    belongs_to :author, class_name: 'User'




# TODO: Create a author_full_name() method into my serializer for fetching stories

# TODO: Create Author serializer 

    # TODO: Put this method inside of my serializer not here if needed
    # def top_five_comments
    #     if self.comments.size > 0
    #      ordered = self.comments.order(created_at: :asc).first(5)
    #     end
    #     ordered.map do |comment|
    #         [comment.body, User.find_by(id: author_id).name]
    #     end
    # end

end

