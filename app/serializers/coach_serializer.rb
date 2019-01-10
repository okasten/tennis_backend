class CoachSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :email, :picture, :location
  has_many :students
  has_many :players, through: :students
  has_many :lessons, through: :students
end
