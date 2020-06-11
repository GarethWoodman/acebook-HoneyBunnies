class FriendsController < ApplicationController
  def create
    Friend.create(user_id: session[:user_id], friend_id: params[:friend_id])
    Friend.create(user_id: params[:friend_id], friend_id: session[:user_id])

    redirect_to "/users/#{params[:friend_id]}"
  end

  def destroy
    Friend.find_by(user_id: session[:user_id], friend_id: params[:friend_id]).destroy
    Friend.find_by(user_id: params[:friend_id], friend_id: session[:user_id]).destroy

    redirect_to "/users/#{params[:friend_id]}"
  end
end
