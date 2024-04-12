class Admin::PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :is_matching_login_admin, only: [:index, :show, :edit, :update]

  def index
    @pets = Pet.all
    @pets = Pet.all.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      flash[:notice] = "プロフィールを更新しました。"
      redirect_to admin_pet_path(@pet)
    else
      flash[:alert] = "プロフィールの更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to admin_pets_path
  end

  private
  def set_pet
    @pet = Pet.find(params[:id])
  end

  def is_matching_login_admin
    unless current_admin
      redirect_to root_path
    end
  end

  def pet_params
    params.require(:pet).permit(:customer_id, :name, :breed_type, :mix_breed_info, :gender, :age, :introduction, :pet_image)
  end
end
