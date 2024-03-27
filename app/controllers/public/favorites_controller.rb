class Public::FavoritesController < ApplicationController
  def index
    @favorites = current_customer.favorites.includes(:post)
    @posts = @favorites.map(&:post)
  end
  
  def create
    post = Post.find(params[:post_id])
    if current_customer
      favorite = current_customer.favorites.new(post_id: post.id)
      favorite.save
      redirect_to post_path(post)
    else
      redirect_to customer_session_path, alert: 'ログインしてください'
    end
  end
  
  def destroy
    post = Post.find(params[:post_id])
    favorite = current_customer.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to post_path(post)
  end
  
  private
  def favorite_params
    params.require(:favorite).permit(:customer_id, :post_id)
  end
end
