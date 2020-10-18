class LikesController < ApplicationController
  def create
    @micropost = Micropost.find_by(id: params[:id])
    @like = @micropost.likes.new(user_id: current_user.id)
    if @like.save!
      flash[:success] = "Like created!"
    else
      flash[:danger] = "Failed"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    if @like.destoy
      flash[:success] = "Unliked"
    else
      flash[:danger] = "Failed"
    end
    redirect_back(fallback_location: root_path)
  end
end
