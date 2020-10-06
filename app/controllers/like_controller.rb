class LikeController < ApplicationController
  before_action :check_logged_in_user, only: [:like]

  def create
    @post = Post.find_by(params[:post_id])
    current_user.like(@post)
    @like = Like.create(params[:like_id])
    if @like.save
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    end
  end

  private
  def check_logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
