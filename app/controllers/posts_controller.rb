class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new 
    post = Post.new()
    user = User.find(params[:user_id])
    respond_to do |format|
      format.html { render :new, locals: { post: post, user: user } }
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
