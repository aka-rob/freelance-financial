class Job < ApplicationRecord
  has_many :expenses

  validates :date, presence: true
  validates :client, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  # job.expenses.sum(:amount)
end
