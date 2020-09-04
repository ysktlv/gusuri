class Goal < ApplicationRecord
  belongs_to :user
  has_many :goal_reflections, dependent: :destroy
  has_many :reflections, through: :goal_reflections

  validates :name, presence: true
  validates :point, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100, message: "は1~100の範囲で設定してください" }
end
