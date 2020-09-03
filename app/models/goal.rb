class Goal < ApplicationRecord
  has_many :goal_reflections, dependent: :destroy
  has_many :reflections, through: :goal_reflections
end
