class TotalPoint < ApplicationRecord
  belongs_to :reflection

  validates :point, presence: true
end
