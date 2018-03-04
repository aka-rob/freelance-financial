class ExpensesController < ApplicationController

  def new
    @expense = Expense.new
  end

  def create
    @job = Job.find(params[:job_id])
    @expense = @job.expenses.new(expense_params)
    # @expense.user = current_user

    if @expense.save
      flash[:notice] = "The expense was added!"
      redirect_to job_expenses_path(params[:job_id])
    else
      flash.now[:alert] = "There was an error saving your expense, please try again."
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :date, :category, :job_id)
  end
end
