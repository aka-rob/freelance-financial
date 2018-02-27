require_relative "../services/job_service.rb"

class JobsController < ApplicationController
  
  # will be replaced by DashboardController#index
  def index
    @jobs = JobService.get_all_jobs
  end

  def show
    @job = JobService.find_job(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    current_user = nil # change when user model implemented
    @job = JobService.new_job(job_params, current_user)

    if @job.save
      flash[:notice] = "The job was added!"
      redirect_to @job
    else
      flash.now[:alert] = "There was an error saving your job, please try again."
      render :new
    end
  end

  def edit
    @job = JobService.find_job(params[:id])
  end

  def update
    @job = JobService.update_job(params[:id], job_params)

    if @job.save
      flash[:notice] = "Job details were updated."
      redirect_to @job
    else
      flash.now[:alert] = "There was an error updating the job, please try again."
      render :edit
    end
  end

  def destroy
    @job = JobService.find_job(params[:id])

    if @job.destroy
      flash[:notice] = "Your job has successfully been deleted."
      redirect_to jobs_url
    else
      flash.now[:alert] = "There was an error deleting the job."
      render :show
    end
  end

  private
  
  def job_params
    params.require(:job).permit(:date, :client, :description, :location, :amount, :paid, :notes)
  end

end
