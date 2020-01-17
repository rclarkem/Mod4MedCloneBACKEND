class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :avatar, :bio, :img 
  has_many :authored_stories
  


# TODO: Serializer for stories with comments

end
