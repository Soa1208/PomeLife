class Public::CustomersController < ApplicationController
  before_action :set_current_customer, only: [:edit, :update]
  
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end
  
  def update
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer), notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end
  
  private
  
  def set_current_customer
    @customer = current_customer
  end
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :display_name, :gender, :email, :encrypted_password, :postal_code, :address, :telephone_number, :introduction, :is_active, :customer_image)
  end
end
