class Public::PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update]
  
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
  end

  def show
  end

  def edit
  end
  
  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to pet_path(@pet.id)
    else
      render :edit
    end
  end
    
  def destroy
    
  end
  
  private
  def set_pet
    @pet = Pet.find(params[:id])
  end
  
  def pet_params
    params.require(:pet).permit(:customer_id, :name, :breed_type, :mix_breed_info, :gender, :age, :introduction, :image)
  end
end
