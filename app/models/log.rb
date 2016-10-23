class Log < ApplicationRecord
  belongs_to :cat

  validates :weight, presence: true, numericality: {greater_than: 0}
end
