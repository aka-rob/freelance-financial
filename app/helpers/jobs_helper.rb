module JobsHelper
  def job_paid?(job)
    if job.paid
      return "Paid"
    else
      return "Payment Outstanding"
    end
  end

  def current_month_profit(jobs)
    current_month_jobs = jobs.where(date: Date.today.beginning_of_month..Date.today.end_of_month)

    profit = 0

    current_month_jobs.each do |job|
      profit += job.profit
    end

    return profit
  end

  def ytd_profit(jobs)
    current_year_jobs = jobs.where(date: Date.today.beginning_of_year..Date.today.end_of_year)

    profit = 0

    current_year_jobs.each do |job|
      profit += job.profit
    end

    return profit
  end

  def avg_monthly_profit(jobs)
    ytd_profit(jobs) / Date.today.month
  end
end
