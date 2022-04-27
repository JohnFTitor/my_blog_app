require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  describe 'GET /index' do
    it 'is the root of the website' do
      get '/'
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end

    it 'has a success status' do
      get '/users'
      expect(response).to have_http_status(:ok)
    end

    context 'renders index template' do
      it 'renders correct template' do
        get '/users'
        expect(response).to render_template(:index)
      end
      it "doesn't render other template" do
        get '/users'
        expect(response).to_not render_template(:show)
      end
    end

    it 'has index placeholder' do
      get '/users'
      expect(response.body).to include('List all users')
    end
  end

  describe 'GET /show' do
    it 'has a success status' do
      get '/users/2'
      expect(response).to have_http_status(:ok)
    end

    context 'renders show template' do
      it 'renders correct template' do
        get '/users/2'
        expect(response).to render_template(:show)
      end

      it "doesn't render other template" do
        get '/users/2'
        expect(response).to_not render_template(:index)
      end
    end

    it 'assings id to user' do
      get '/users/2'
      expect(assigns(:user)).to eq('2')
    end

    it 'contains show placeholder' do
      get '/users/2'
      expect(response.body).to include('Shows information for user number: 2')
    end
  end
end
