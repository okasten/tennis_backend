class Coach < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
  has_many :lessons
  has_many :players, through: :lessons
end
