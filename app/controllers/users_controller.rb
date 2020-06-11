class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    # session[:user_id] = user.id
    # If user does not meet the conditions user.id will be nil
    if user.save
      redirect_to '/sessions/new', notice: `Welcome #{user.fname} #{user.lname}`
    else
      redirect_to '/', notice: 'Email and/or password are/is not meeting the requirements'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      redirect_to "/users/#{@user.id}", notice: 'Profile Updated'
    else
      redirect_to "/users/#{@user.id}/edit", notice: 'Provided details are not valid'
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
    session[:user_id] = nil
    redirect_to '/', notice: 'Account deleted successfully'
  end

  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :image)
  end

end
