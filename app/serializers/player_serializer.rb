class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :email, :age, :level, :picture, :location
end
