class StorySerializer < ActiveModel::Serializer
  attributes :id, :author_id, :author_full_name, :author_avatar, :title, :story_length, :body

def author_full_name
  author = self.object.author_id
  User.find_by(id: author).name
end

def author_avatar
  author = self.object.author_id
  User.find_by(id: author).img
end

def story_length
  length = self.object.body
  length.truncate(50, :omission => "... (continued)")
end

end

