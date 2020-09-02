class Goal < ApplicationRecord
  has_many :goal_reflections
  has_many :reflections, through: :goal_reflections
end