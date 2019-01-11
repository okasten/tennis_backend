class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :email, :age, :level, :picture, :location
  has_many :lessons
  has_many :coaches, through: :lessons
end
