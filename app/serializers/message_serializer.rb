class MessageSerializer < ActiveModel::Serializer
  attributes :id, :time, :date, :subject, :read, :to, :from, :content, :conversation
end
