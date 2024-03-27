class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_current_customer, only: [:edit, :update]
  before_action :ensure_guest_customer, only: [:edit]
  
  def show
    @customer = Customer.find(params[:id])
    @pets = @customer.pets
    @posts = @customer.posts
    @questions = @customer.questions
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
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :display_name, :gender, :email, :encrypted_password, :postal_code, :address, :telephone_number, :introduction, :is_active, :profile_image)
  end
  
  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.guest_customer?
      redirect_to customer_path(current_customer) , notice: "ゲストログインではプロフィール編集は行えません。"
    end
  end  
end
