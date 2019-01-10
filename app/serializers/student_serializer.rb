class StudentSerializer < ActiveModel::Serializer
  attributes :id, :coach, :player
  belongs_to :coach
  belongs_to :player
  has_many :lessons
end
