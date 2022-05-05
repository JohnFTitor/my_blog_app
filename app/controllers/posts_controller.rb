class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @like = Like.new
  end

  def new 
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

  def create
    post = Post.new(get_params)
    post.author = current_user
    respond_to do |format|
      format.html do
        if post.save
          redirect_to action: :index, user_id: post.author.id
        else
          render :new, locals: { post: post }
        end
      end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  private
  
  def get_params
    response = params.require(:post).permit(:title, :text)
  end
end
