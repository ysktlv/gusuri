class Goal < ApplicationRecord
  belongs_to :user
  has_many :goal_reflections, dependent: :destroy
  has_many :reflections, through: :goal_reflections

  VALID_POINT_REGEX = /^[0-9]+$/

  validates :name, presence: true
  validates :point, presence: true, format: { with: VALID_POINT_REGEX, message: "は半角整数を使用してください" }
end
