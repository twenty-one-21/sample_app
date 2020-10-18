class LikesController < ApplicationController
  before_action :check_logged_in_user, only: [:create]

  def create
    @micropost = Micropost.find_by(params[:micropost_id])
    @micropost.likes.new(user_id: current_user.id)
    @like = @micropost.likes.new(user_id: current_user.id)
    if @like.save!
      flash[:success] = "Like created!"
    else
      flash[:danger] = "Failed"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(params[:like_id])
    @like.destroy
    if current_user.destroy(@like)
      flash[:success] = "Unliked"
    else
      flash[:danger] = "Failed"
    end
    redirect_to request.referrer || root_url
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
