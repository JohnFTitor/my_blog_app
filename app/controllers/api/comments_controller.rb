class Api::CommentsController < ApplicationController
  before_action :authorize_request

  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    json_response(@post.comments)
  end 
  
end
