class Admin::PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
  
  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end
  
  def edit
  end
  
  def destroy
    @post.destroy
    redirect_to admin_posts_url, notice: '投稿が削除されました。'
  end
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:customer_id, :pet_id, :title, :body, :image)
  end
end