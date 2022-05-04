class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new 
    post = Post.new
    user = User.find(params[:user_id])
    respond_to do |format|
      format.html { render :new, locals: { post: post, user: user } }
    end
  end

  def create
    post = Post.new(get_params)
    respond_to do |format|
      format.html do
        if post.save
          redirect_to action: :index, user_id: post.author.id
        else
          render :new, locals: { post: post, user: post.author}
        end
      end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private
  
  def get_params
    response = params.require(:post).permit(:author, :title, :text)
    response[:author] = User.find(response[:author])
    response
  end
end
