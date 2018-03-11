class ExpensesController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @expense = @job.expenses.new
  end

  def create
    @job = Job.find(params[:job_id])
    @expense = @job.expenses.new(expense_params)
    # @expense.user = current_user

    if @expense.save
      flash[:notice] = "The expense was added!"
      redirect_to job_path(params[:job_id])
    else
      flash.now[:alert] = "There was an error saving your expense, please try again."
      render :new
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update(expense_params)
      flash[:notice] = "Exense was updated!"
      redirect_to job_path(params[:job_id])
    else
      flash.now[:alert] = "There was an error updating your expense, please try again."
      render :edit
    end
  end

  def destroy
    @expense = Expense.find(params[:id])

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
