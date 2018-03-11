class Job < ApplicationRecord
  has_many :expenses, dependent: :destroy
  belongs_to :user

  validates :date, presence: true
  validates :client, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  def profit
    return amount - expenses.sum(:amount)
  end

  def sum_expenses
    return expenses.sum(:amount)
  end
end
