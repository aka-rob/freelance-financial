require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:expense) { create(:expense) }

  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }

  describe 'attributes' do
    it 'has name, amount, category, and date attributes' do
      expect(expense).to have_attributes( name: expense.name, amount: expense.amount, category: expense.category, date: expense.date )
    end
  end

end
