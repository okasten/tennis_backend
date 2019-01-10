class CoachSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :name, :email, :picture, :location
end
