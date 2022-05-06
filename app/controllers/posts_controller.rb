class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @like = Like.new
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    post = Post.new(fetch_params)
    post.author = current_user
    post.likes_counter = 0
    post.comments_counter = 0
    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = "Post was successfully created!"
          redirect_to action: :index, user_id: current_user.id
        else
          flash.now[:error] = "Wrong value"
          render :new, status: 422, locals: { post: post }
        end
      end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  private

  def fetch_params
    params.require(:post).permit(:title, :text)
  end
end
