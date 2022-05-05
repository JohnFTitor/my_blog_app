class LikesController < ApplicationController
  def index
    redirect_to users_path
  end

  def create
    like = Like.new(get_params)
    like.author = current_user
    respond_to do |format|
      format.html do 
        if like.save 
          redirect_back(fallback_location: root_path)
        end
      end
    end
  end

  private 

  def get_params
    response = params.require(:like).permit(:post)
    response[:post] = Post.find(response[:post])
    response
  end
end
