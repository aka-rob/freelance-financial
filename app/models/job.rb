class Job < ApplicationRecord
  # has_many :expenses

  validates :date, presence: true
  validates :client, presence: true
  validates :amount, presence: true
end
