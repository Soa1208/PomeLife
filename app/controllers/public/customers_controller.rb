class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :display_name, :gender, :email, :encrypted_password, :postal_code, :address, :telephone_number, :introduction, :is_active, :customer_image)
  end
end
