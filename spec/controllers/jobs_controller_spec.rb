require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  let(:my_job) { create(:job) }

  # GET index will be handled by dashboard_controller#index
  # describe "GET index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end

  #   it "assigns Job.all to @job" do
  #     get :index
  #     expect(assigns(:jobs)).to eq([my_job])
  #   end
  # end

  describe "GET show" do
    it "returns http success" do
      get :show, params: { id: my_job.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: my_job.id }
      expect(response).to render_template :show
    end

    it "assigns my_job to @job" do
      get :show, params: { id: my_job.id }
      expect(assigns(:job)).to eq(my_job)
    end
  end

  describe "GET new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the #new view' do
      get :new
      expect(response).to render_template :new
    end

    it 'instantiates @job' do
      get :new
      expect(assigns(:job)).not_to be_nil
    end
  end

  describe 'POST create' do
    it 'increases the count of Job by 1' do
      expect{ post :create, params: {date: my_job.date, client: my_job.client, description: my_job.description, location: my_job.location, amount: my_job.amount, paid: my_job.paid, notes: my_job.notes } }
    end

    it "assigns the new job to @job" do
      post :create, params: {job: {date: my_job.date, client: my_job.client, description: my_job.description, location: my_job.location, amount: my_job.amount, paid: my_job.paid, notes: my_job.notes } }
      expect(assigns(:job)).to eq Job.last
    end

    it 'redirects to the new job' do
      post :create, params: { job: {date: my_job.date, client: my_job.client, description: my_job.description, location: my_job.location, amount: my_job.amount, paid: my_job.paid, notes: my_job.notes } }
      expect(response).to redirect_to Job.last
    end
  end

  describe 'GET edit' do
    it 'returns HTTP success' do
      get :edit, params: { id: my_job.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the #edit view' do
      get :edit, params: { id: my_job.id }
      expect(response).to render_template :edit
    end

    it 'assigns job to be updated to @job' do
      get :edit, params: { id: my_job.id }
      job_instance = assigns(:job)

      expect(job_instance.id).to eq my_job.id
      expect(job_instance.date).to eq my_job.date
      expect(job_instance.client).to eq my_job.client
      expect(job_instance.description).to eq my_job.description
      expect(job_instance.location).to eq my_job.location
      expect(job_instance.amount).to eq my_job.amount
      expect(job_instance.paid).to eq my_job.paid
      expect(job_instance.notes).to eq my_job.notes
    end
  end

  describe 'PUT update' do
      let(:new_job) { create(:job) }
    
    it 'updates job with expected attirbutes' do
      put :update, params: { id: my_job.id, job: { date: new_job.date, client: new_job.client, description: new_job.description, location: new_job.location, amount: new_job.amount, paid: new_job.paid, notes: new_job.notes } }
      updated_job = assigns(:job)
      expect(updated_job.id).to eq my_job.id
      expect(updated_job.date).to eq new_job.date
      expect(updated_job.client).to eq new_job.client
      expect(updated_job.description).to eq new_job.description
      expect(updated_job.location).to eq new_job.location
      expect(updated_job.amount).to eq new_job.amount
      expect(updated_job.paid).to eq new_job.paid
      expect(updated_job.notes).to eq new_job.notes
    end

    it 'redirects to the updated job' do
      put :update, params: { id: my_job.id, job: { date: new_job.date, client: new_job.client, description: new_job.description, location: new_job.location, amount: new_job.amount, paid: new_job.paid, notes: new_job.notes } }
      expect(response).to redirect_to my_job
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the job' do
      delete :destroy, params: { id: my_job.id }
      count = Job.where( { id: my_job.id } ).size
      expect(count).to eq 0
    end

    it 'redirects to jobs index' do
      delete :destroy, params: { id: my_job.id }
      expect(response).to redirect_to jobs_path
    end
  end
end
