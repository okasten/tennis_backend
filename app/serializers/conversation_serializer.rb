class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :player, :coach, :messages
end
