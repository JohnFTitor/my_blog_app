require 'rails_helper'

RSpec.describe 'PostsControllers', type: :request do
  before :all do
    User.destroy_all
    user = User.create(id: 2, name: 'test 1', photo: 'photo 1', bio: 'text 1', posts_counter: 0, email: "fakeemail2@gmail.com",
      password: "123456", confirmed_at: DateTime.now)
    post1 = Post.create(id: 1, author: user, title: 'Post title-1', text: 'Some text', likes_counter: 0,
                        comments_counter: 0)
    post2 = Post.create(id: 2, author: user, title: 'Post title-2', text: 'Some text', likes_counter: 0,
                        comments_counter: 0)
    Post.create(id: 3, author: user, title: 'Post title-3', text: 'Some text', likes_counter: 0, comments_counter: 0)
    Comment.create(id: 1, author: user, post: post1, text: 'comment-1')
    Comment.create(id: 2, author: user, post: post2, text: 'comment-2')
  end

  describe 'GET /index' do
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

    it 'assings user to local variable' do
      get '/users/2/posts'
      expect(assigns(:user).id).to eq(2)
    end

    it 'should have three posts' do
      get '/users/2/posts'
      expect(assigns(:posts).length).to eq(3)
    end

    it 'has user card' do
      get '/users/2/posts'
      expect(response.body).to include('test 1')
    end

    it 'has posts rendered' do
      get '/users/2/posts'
      expect(response.body).to include('Post title-1')
      expect(response.body).to include('Post title-2')
    end

    it 'has comments rendered' do
      get '/users/2/posts'
      expect(response.body).to include('comment-1')
      expect(response.body).to include('comment-2')
    end
  end

  describe 'GET /show' do
    it 'has a success status' do
      get '/users/2/posts/1'
      expect(response).to have_http_status(:ok)
    end

    context 'renders show template' do
      it 'renders correct template' do
        get '/users/2/posts/1'
        expect(response).to render_template(:show)
      end

      it "doesn't render other template" do
        get '/users/2/posts/1'
        expect(response).to_not render_template(:index)
      end
    end

    it 'assings user to local variable' do
      get '/users/2/posts/1'
      expect(assigns(:user).id).to eq(2)
    end

    it 'assings post to local variable' do
      get '/users/2/posts/1'
      expect(assigns(:post).id).to eq(1)
    end

    it 'contains post primary info' do
      get '/users/2/posts/1'
      expect(response.body).to include('Some text')
      expect(response.body).to include('Post title-1')
    end

    it 'has specific comments rendered' do
      get '/users/2/posts/1'
      expect(response.body).to include('comment-1')
      expect(response.body).to_not include('comment-2')
    end
  end
end
