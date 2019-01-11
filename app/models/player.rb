class Player < ApplicationRecord
  has_secure_password
  has_many :lessons
  has_many :coaches, through: :lessons
end
