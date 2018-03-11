module JobService
  def self.get_user_jobs
    return Job.all.order(:date)
  end

  def self.find_job(id)
    return Job.find(id)
  end

  def self.new_job(job_params, user)
    job = Job.new(job_params)
    job.user_id = user.id
    return job
  end

  # Not working currently
  # def self.update_job(id, job_params)
  #   job = Job.find_by(id)
  #   job.assign_attributes(job_params)
  #   return job
  # end
end
