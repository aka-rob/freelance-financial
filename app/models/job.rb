class Job < ApplicationRecord
  has_many :expenses, dependent: :destroy
  belongs_to :user

  validates :date, presence: true
  validates :client, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  def sum_expenses
    return expenses.sum(:amount)
  end

  def profit
    return amount - sum_expenses
  end

end
