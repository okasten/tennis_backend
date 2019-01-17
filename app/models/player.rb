class Player < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
  has_many :lessons
  has_many :coaches, through: :lessons
  has_many :conversations
  has_many :messages, through: :conversations
  has_many :goals
end
