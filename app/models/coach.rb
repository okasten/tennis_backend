class Coach < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
  has_many :students
  has_many :players, through: :students
  has_many :lessons, through: :students
end
