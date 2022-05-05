class LikesController < ApplicationController
  def index
    redirect_to users_path
  end

  def create
    like = Like.new(fetch_params)
    like.author = current_user
    respond_to do |format|
      format.html do
        redirect_back(fallback_location: root_path) if like.save
      end
    end
  end

  private

  def fetch_params
    response = params.require(:like).permit(:post)
    response[:post] = Post.find(response[:post])
    response
  end
end
