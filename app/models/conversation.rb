class Conversation < ApplicationRecord
  belongs_to :player
  belongs_to :coach
  has_many :messages
end
