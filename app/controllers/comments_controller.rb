class CommentsController < ApplicationController
  def index
    redirect_to users_path
  end

  def create 
    comment = Comment.new(get_params)
    respond_to do |format|
      format.html do
        comment.save
        redirect_back(fallback_location: root_path)
      end
    end
  end

  private
  
  def get_params
    response = params.require(:comment).permit(:author, :post, :text)
    response[:author] = User.find(response[:author])
    response[:post] = Post.find(response[:post])
    response
  end
end
