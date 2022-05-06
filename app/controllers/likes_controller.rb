class LikesController < ApplicationController
  def index
    redirect_to users_path
  end

  def create
    respond_to do |format|
      format.html do
        params = fetch_params
        post = Post.find(params[:post])
        params[:post] = post

        if post.liked?(current_user)
          flash[:unliked] = 'Unliked post'
          like = post.likes.find_by(author_id: current_user.id)
          Like.destroy(like.id)
          redirect_back(fallback_location: root_path)
          return
        end

        like = Like.new(params)
        like.author = current_user
        if like.save
          flash[:liked] = "Liked post"
          redirect_back(fallback_location: root_path)
        end
      end
    end
  end

  private

  def fetch_params
    params.require(:like).permit(:post)
  end
end
