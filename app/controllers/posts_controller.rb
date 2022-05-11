class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc).includes(:comments)
    @like = Like.new
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    post = Post.new(post_params)
    post.author = current_user
    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Post was successfully created!'
          redirect_to action: :index, user_id: current_user.id
        else
          flash.now[:error] = 'Wrong value'
          render :new, status: 422, locals: { post: }
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

  def delete
    id = params[:id]
    user_id = params[:user_id]
    Post.destroy(id)
    redirect_to action: :index, user_id:
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :likes_counter, :comments_counter)
  end
end
