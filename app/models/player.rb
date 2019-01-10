class Player < ApplicationRecord
  has_secure_password
  has_many :students
  has_many :lessons, through: :students
  has_many :coaches, through: :students
end
