class Reflection < ApplicationRecord
  has_many :goal_reflections, dependent: :destroy
  has_many :goals, through: :goal_reflections
end
