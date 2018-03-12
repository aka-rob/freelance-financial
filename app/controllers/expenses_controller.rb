require_relative "../services/job_service.rb"
require_relative "../services/expense_service.rb"


class ExpensesController < ApplicationController

  def new
    @job = JobService.find_job(params[:job_id])
    @expense = @job.expenses.new
  end

  def create
    @job = JobService.find_job(params[:job_id])
    @expense = ExpenseService.new_expense(@job, expense_params)

    if @expense.save
      flash[:notice] = "The expense was added!"
      redirect_to job_path(params[:job_id])
    else
      flash.now[:alert] = "There was an error saving your expense, please try again."
      render :new
    end
  end

  def edit
    @expense = ExpenseService.find_expense(params[:id])
  end

  def update
    @expense = ExpenseService.find_expense(params[:id])

    if @expense.update(expense_params)
      flash[:notice] = "Exense was updated!"
      redirect_to job_path(params[:job_id])
    else
      flash.now[:alert] = "There was an error updating your expense, please try again."
      render :edit
    end
  end

  def destroy
    @expense = ExpenseService.find_expense(params[:id])

    if @expense.destroy
      flash[:notice] = "Expense was successfully deleted."
      redirect_to job_path(params[:job_id])
    else
      flash[:alert] = "There was an error deleting your expense, please try again."
      redirect_to job_path(params[:job_id])
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :date, :category, :job_id)
  end
end
