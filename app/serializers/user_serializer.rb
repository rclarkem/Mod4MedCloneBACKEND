class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :avatar, :bio, :img 
  has_many :following_users
  has_many :followed_users
  has_many :authored_stories
  
  

end
