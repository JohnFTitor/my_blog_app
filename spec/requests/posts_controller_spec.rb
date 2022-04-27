require 'rails_helper'

RSpec.describe "PostsControllers", type: :request do
  describe "GET /index" do
    it 'has a success status' do 
      get '/users/2/posts'
      expect(response).to have_http_status(:ok)
    end

    context 'renders index template' do
      it 'renders correct template' do 
        get '/users/2/posts'
        expect(response).to render_template(:index)
      end
      it "doesn't render other template" do 
        get '/users/2/posts'
        expect(response).to_not render_template(:show)
      end
    end

    it 'assings user_id to local variable' do 
      get "/users/2/posts"
      expect(assigns(:user_id)).to eq('2')
    end  

    it 'has index placeholder' do 
      get '/users/2/posts'
      expect(response.body).to include('Displays list of posts for user number: 2')
    end
  end
end
