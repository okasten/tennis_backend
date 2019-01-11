class Lesson < ApplicationRecord
  belongs_to :coach
  belongs_to :player, optional: true
end
