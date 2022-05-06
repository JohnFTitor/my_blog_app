class CommentsController < ApplicationController
  def index
    redirect_to users_path
  end

  def create
    comment = Comment.new(fetch_params)
    comment.author = current_user
    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment added succesfully'
        else
          flash[:error] = "Can't add empty comment"
        end
        redirect_back(fallback_location: root_path)
      end
    end
  end

  private

  def fetch_params
    response = params.require(:comment).permit(:post, :text)
    response[:post] = Post.find(response[:post])
    response
  end
end
