class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :author_id, :story_id, :author_full_name, :author_avatar, :created_at


  def author_full_name
  author = self.object.author_id
  User.find_by(id: author).name
end

def author_avatar
  author = self.object.author_id
  User.find_by(id: author).img
end

end
