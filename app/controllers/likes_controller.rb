class LikesController < ApplicationController
  before_action :check_logged_in_user, only: [:create]

  def create
    @post = Post.find_by(params[:post_id])
    @user = User.find(params[:user_id])
    @post.likes.new(user_id: current_user.id)
    if @like.save
      flash[:success] = "Like created!"
    else
      flash[:danger] = "Failed"
    end
    redirect_back(fallback_location: root_path)
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
