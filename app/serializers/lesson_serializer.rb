class LessonSerializer < ActiveModel::Serializer
  attributes :id, :time, :date, :duration, :location, :coach, :player, :notes
  belongs_to :student
end
