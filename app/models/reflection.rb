class Reflection < ApplicationRecord
  belongs_to :user
  has_many :goal_reflections, dependent: :destroy
  has_many :goals, through: :goal_reflections
  has_one :total_point, dependent: :destroy

  validate :not_after_today
  validates :impression, presence: true

  def not_after_today
    errors.add(:start_time, "は今日以前を選択してください") if start_time.nil? || start_time >= Date.today 
  end
end
