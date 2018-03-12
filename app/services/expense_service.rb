module ExpenseService
  def self.find_expense(id)
    return Expense.find(id)
  end

  def self.new_expense(job, expense_params)
    job.expenses.new(expense_params)
  end
end
