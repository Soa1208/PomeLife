class Public::PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_customer.pets.build(pet_params)
    if @pet.save
      redirect_to pet_path(@pet.id)
    else
      render :new
    end
  end

  def index
    @pets = Pet.all
    @pets = Pet.all.order(created_at: :desc)
  end

  def show
    @posts = @pet.posts
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet.id)
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private
  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:customer_id, :name, :breed_type, :mix_breed_info1, :mix_breed_info2, :gender, :birthday, :introduction, :pet_image)
  end
end
