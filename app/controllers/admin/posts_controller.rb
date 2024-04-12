class Admin::PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
  before_action :is_matching_login_admin, only: [:index, :show, :edit, :update]

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

  def is_matching_login_admin
    unless current_admin
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(:customer_id, :pet_id, :title, :body, :post_image)
  end
end