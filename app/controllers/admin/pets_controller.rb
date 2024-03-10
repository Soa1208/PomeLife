class Admin::PetsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end
  
  private
  def pet_params
    params.require(:pet).permit(:customer_id, :name, :breed_type, :mix_breed_info, :gender, :age, :introduction, :pet_image)
  end
end
