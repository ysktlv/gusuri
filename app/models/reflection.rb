class Reflection < ApplicationRecord
  has_many :goal_reflections
  has_many :goals, through: :goal_reflections
end
