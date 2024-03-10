class Public::FavoritesController < ApplicationController
  def index
  end
  
  private
  def favorite_params
    params.require(:favorite).permit(:customer_id, :post_id)
  end
end
