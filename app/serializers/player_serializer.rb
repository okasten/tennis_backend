class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :email, :age, :level, :picture, :location
  has_many :students
  has_many :lessons, through: :students
  has_many :coaches, through: :students
end
