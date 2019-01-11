class LessonSerializer < ActiveModel::Serializer
  attributes :id, :time, :date, :duration, :location, :coach, :player, :notes
  belongs_to :coach
  belongs_to :player, optional: true
end
