require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:job) { create(:job) }
  # let(:expense) { create(:expense) }

  # it { is_epxected.to have_many(:expenses) }

  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:client) }
  it { is_expected.to validate_presence_of(:amount) }

  describe 'attributes' do
    it 'has date client, description, location, amount, paid, and notes attributes' do
      expect(job).to have_attributes(date: job.date, client: job.client, description: job.description, location: job.location, amount: job.amount, paid: job.paid, notes: job.notes )
    end
  end

end
