class StorySerializer < ActiveModel::Serializer
  attributes :id, :author_id, :author_full_name, :author_avatar, :title,:body

def author_full_name
  author = self.object.author_id
  User.find_by(id: author).name
end

def author_avatar
  author = self.object.author_id
  User.find_by(id: author).img
end

end

#  TODO: Add Migration for images for stories table