class Admin::PostsController < ApplicationController
  def index
  end

  def show
  end
  
  private
  def post_params
    params.require(:post).permit(:customer_id, :pet_id, :title, :body, :post_image)
  end
end
