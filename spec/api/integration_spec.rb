require 'swagger_helper'

describe 'Users API' do

  before :all do
    User.destroy_all
    user = User.create(id: 1, name: 'User-1', photo: 'user_image-1', bio: 'some1', email: 'user1@example.com',
                password: '123456', confirmed_at: DateTime.now, posts_counter: 12)
    (1..10).each do |i|
      post = Post.new(title: "title-#{i}", text: 'text', comments_counter: 0, likes_counter: 0)
      post.author = user
      post.save
    end
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
      
      response '200', 'Login succesfully' do
        let(:login) {{ email: 'user1@example.com', password: '123456' }}
        run_test!
      end
      
      response '401', 'Login invalid - No proper credentials' do
        let(:login) {{ email: 'jhygb1@example.com', password: '123456' }}
        run_test!
      end
    end
  end

  path '/api/users/{user_id}/posts' do 
    get 'Posts of a specific user' do 
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :user_id, in: :path, type: :string
      parameter name: :Authorization, in: :headers, type: :string

      response '200', 'Posts Found' do
        schema type: :array,
        properties: {
          id: { type: :integer },
          author_id: { type: :integer },
          title: { type: :string },
          text: { type: :text },
          likes_counter: { type: :integer },
          created_at: { type: :datetime },
          updated_at: { type: :datetime }
        },
        required: ['id', 'author_id', 'title', 'text', 'likes_counter', 'created_at', 'updated_at']

        let(:user_id) { 1 }
        let(:"Authorization") { "Bearer #{token_for(user)}" }
        run_test!
      end
    end
  end



end
