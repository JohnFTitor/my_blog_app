class CommentsController < ApplicationController
  def index
    redirect_to users_path
  end

  def create 
    comment = Comment.new(get_params)
    comment.author = current_user
    respond_to do |format|
      format.html do
        comment.save
        redirect_back(fallback_location: root_path)
      end
    end
  end

  private
  
  def get_params
    response = params.require(:comment).permit(:post, :text)
    response[:post] = Post.find(response[:post])
    response
  end
end
