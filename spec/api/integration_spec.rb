require 'swagger_helper'
require 'rails_helper' 

describe 'Users API' do

  before :all do
    User.destroy_all
    User.create(id: 1, name: 'User-1', photo: 'user_image-1', bio: 'some1', email: 'user1@example.com',
                password: '123456', confirmed_at: DateTime.now, posts_counter: 12)
  end
  
  path '/api/auth/login' do
    post 'Authentication' do
      consumes 'application/json'
      parameter name: :login, in: :body, schema:{
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: ['email', 'password']
      }
      
      response '200', 'login succesfully' do
        let(:login) {{ email: 'user1@example.com', password: '123456' }}
        run_test!
      end
    end
  end  
end
