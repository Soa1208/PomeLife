class Admin::CustomersController < ApplicationController
  before_action :set_current_customer, only: [:show, :edit, :update]
  
  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end
  
  def update
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
  end
  
  private
  def set_current_customer
    @customer = Customer.find(params[:id])
  end
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :display_name, :gender, :email, :encrypted_password, :postal_code, :address, :telephone_number, :introduction, :is_active, :customer_image)
  end
end
