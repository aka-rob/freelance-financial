module JobService

  def self.get_user_jobs(user)
    return Job.where(user_id: user.id).order(:date)
  end

  def self.find_job(id)
    job = Job.find(id)
  end

  def self.new_job(job_params, user)
    job = Job.new(job_params)
    job.user_id = user.id
    return job
  end
end
