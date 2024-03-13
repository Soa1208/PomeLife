class Public::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      logger.error @post.errors.full_messages.join(", ")
      render :new
    end
  end
  
  def index
    @posts = Post.all
  end

  def show
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: '投稿が更新されました。'
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path, notice: '投稿が削除されました。'
  end
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:customer_id, :pet_id, :title, :body, :image)
  end
end