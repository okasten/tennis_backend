class CoachSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :email, :picture, :location
  has_many :lessons
  has_many :players, through: :lessons
end
