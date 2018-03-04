require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  let(:my_job) { create(:job) }
  let(:my_expense) { create(:expense) }
  let(:new_expense) { create(:expense) }

  describe 'GET new' do
    it 'returns HTTP success' do
      get :new, params: { job_id: my_job.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the #new view' do
      get :new, params: { job_id: my_job.id }
      expect(response).to render_template :new
    end

    it 'instantiates @expense' do
      get :new, params: { job_id: my_job.id }
      expect(assigns(:expense)).not_to be_nil
    end
  end

  describe 'POST create' do
    it 'increases the count of Expense by 1' do
      expect{ post :create, params: { job_id: my_job.id, expense: { name: Faker::Coffee.blend_name, amount: Faker::Number.decimal(2), date: Faker::Date.between(2.years.ago, Date.today), category: ["travel", "misc", "supplies"].sample, job_id: Job.all.ids.sample } } }.to change(Expense,:count).by(1)
    end

    it "assigns the new expense to @expense" do
      post :create, params: { job_id: my_job.id, expense: { name: my_expense.name, amount: my_expense.amount, date: my_expense.date, category: my_expense.category } }
      expect(assigns(:expense)).to eq Expense.last
    end

    it "redirects to the job's expenses" do
      post :create, params: { job_id: my_job.id, expense: { name: my_expense.name, amount: my_expense.amount, date: my_expense.date, category: my_expense.category } }
      expect(response).to redirect_to job_expenses_path(my_job.id)
    end
  end

  describe 'GET edit' do
    it 'returns HTTP success' do
      get :edit, params: { job_id: my_job.id, id: my_expense.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the #edit view' do
      get :edit, params: { job_id: my_job.id, id: my_expense.id }
      expect(response).to render_template :edit
    end

    it 'assigns expense to be updated to @expense' do
      get :edit, params: { job_id: my_job.id, id: my_expense.id }
      expense_instance = assigns(:expense)

      expect(expense_instance.id).to eq my_expense.id
      expect(expense_instance.name).to eq my_expense.name
      expect(expense_instance.amount).to eq my_expense.amount
      expect(expense_instance.date).to eq my_expense.date
      expect(expense_instance.category).to eq my_expense.category
      expect(expense_instance.job_id).to eq my_expense.job_id
    end
  end

  describe "PUT update" do
    it 'updates job with expected attributes' do
      put :update, params: { job_id: my_job.id, id: my_expense.id, expense: { name: new_expense.name, amount: new_expense.amount, date: new_expense.date, category: new_expense.category } }
      updated_expense = assigns(:expense)

      expect(updated_expense.id).to eq my_expense.id
      expect(updated_expense.name).to eq new_expense.name
      expect(updated_expense.amount).to eq new_expense.amount
      expect(updated_expense.date).to eq new_expense.date
      expect(updated_expense.category).to eq new_expense.category
    end

    it 'redirects to the updated expense' do
      put :update, params: { job_id: my_job.id, id: my_expense.id, expense: { name: new_expense.name, amount: new_expense.amount, date: new_expense.date, category: new_expense.category } }
      expect(response).to redirect_to job_expenses_path( my_job.id )
    end
  end

  describe "DELETE destroy" do
    it 'deletes the expense' do
      delete :destroy, params: { job_id: my_job.id, id: my_expense.id }
      count = Expense.where( {id: my_expense.id } ).size
      expect(count).to eq 0
    end

    it 'redirects to related job' do
      delete :destroy, params: { job_id: my_job.id, id: my_expense.id }
      expect(response).to redirect_to job_expenses_path( my_job.id )
    end
  end
end
