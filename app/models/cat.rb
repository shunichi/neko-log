class Cat < ApplicationRecord
  has_many :logs, dependent: :destroy

  validates :name, presence: true
end
