class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password_digest, :avatar, :bio, :img


# TODO: Serializer for stories with comments

end
