class LikesController < ApplicationController
  def new
  end

  def create
    @like = Like.new(user_id: session[:user_id], post_id: params[:post_id])
    redirect_to posts_url if @like.save
  end

  def destroy
    @like = Like.find_by(user_id: params[:user_id], post_id: params[:post_id])
    @like.destroy
    redirect_to posts_url
  end
end
