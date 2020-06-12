class PostsController < ApplicationController
  def new
    @post = new_post
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    @post.save
    on_users_page?
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    on_users_page?
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    on_users_page?
  end

  def delete_image_attachment
    @post = Post.find(params[:id])
    @image = ActiveStorage::Attachment.find_by(blob_id: params[:image_id])
    @image.purge
    redirect_to "/posts/#{@post.id}/edit"
  end

  def index
    @new_post = new_post
    @posts = Post.all
    @user = User.find_by(id: session[:user_id])
  end

  private

  def on_users_page?
    if params[:on_users_page]
      redirect_to "/users/#{session[:user_id]}"
    else
      redirect_to posts_url
    end
  end

  def post_params
    params.require(:post).permit(:message, images: [])
  end

  def new_post
    Post.new
  end
end
