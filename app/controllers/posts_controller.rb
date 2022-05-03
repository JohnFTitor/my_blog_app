class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user_id = params[:user_id]
    @post_id = params[:id]
  end
end
