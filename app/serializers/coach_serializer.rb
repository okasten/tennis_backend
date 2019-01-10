class CoachSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :email, :picture, :location
end
