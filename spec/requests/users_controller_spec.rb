require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  before :all do
    User.destroy_all 
    User.create(id: 1, name: 'test 1', photo: 'photo 1', bio: 'text 1')
    User.create(id: 2, name: 'test 2', photo: 'photo 2', bio: 'text 2')
    User.create(id: 3, name: 'test 3', photo: 'photo 3', bio: 'text 3')
  end

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
      it 'should contain info off all users' do
        get '/users'
        expect(response.body).to include('test 1')
        expect(response.body).to include('test 2')
        expect(response.body).to include('test 3')
      end
    end

    it 'assings users to local variable' do
      get '/users'
      expect(assigns(:users)).to_not be_nil
    end

    it 'should have a local variable with a length of three' do 
      get '/users'
      expect(assigns(:users).length).to eq(3)
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
