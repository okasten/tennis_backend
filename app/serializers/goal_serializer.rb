class GoalSerializer < ActiveModel::Serializer
  attributes :id, :objective, :met, :player, :kind, :dateMet, :notes, :created_at, :updated_at
  belongs_to :player
end
