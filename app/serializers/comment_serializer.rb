class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :author_id, :story_id, :author_full_name


  def author_full_name
  author = self.object.author_id
  User.find_by(id: author).name
end

end
