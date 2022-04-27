require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
  describe "GET /index" do
    it 'has a success status' do 
      get users_path
      expect(response).to have_http_status(:ok)
    end

    context 'renders index template' do
      it 'renders correct template' do 
        get users_path
        expect(response).to render_template(:index)
      end
      it "doesn't render other template" do 
        get users_path
        expect(response).to_not render_template(:show)
      end
    end

    it 'has index placeholder' do 
      get users_path
      expect(response.body).to include('List all users')
    end
  end
end
