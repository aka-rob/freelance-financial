class JobsController < ApplicationController
  
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    # @job.user = current_user
   

    if @job.save
      flash[:notice] = "The job was added!"
      redirect_to @job
    else
      flash.nw[:alert] = "There was an error saving your job, please try again."
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.assign_attributes(job_params)

    if @job.save
      flash[:notice] = "Job details were updated."
      redirect_to @job
    else
      flash.now[:alert] = "There was an error updating the job, please try again."
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])

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
