module JobsHelper
  def job_paid?(job)
    if job.paid
      return "Paid"
    else
      return "Payment Outstanding"
    end
  end
end
