class Api::CommentsController < ApplicationController
  before_action :authorize_request

  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    json_response(@post.comments)
  end 

  def create
    @post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.post = @post
    comment.author = @current_user
    comment.save!
    json_response(comment, :created)
  end

  def comment_params
    params.permit(:text)
  end
  
end
