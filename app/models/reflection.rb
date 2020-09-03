class Reflection < ApplicationRecord
  belongs_to :user
  has_many :goal_reflections, dependent: :destroy
  has_many :goals, through: :goal_reflections

  validate :not_after_today
  validates :impression, presence: true

  def not_after_today
    errors.add(:start_time, "今日以前の日付を選択してください") if start_time.nil? || start_time >= Date.today 
  end
end
