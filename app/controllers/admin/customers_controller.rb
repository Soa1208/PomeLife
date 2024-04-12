class Admin::CustomersController < ApplicationController
  before_action :set_current_customer, only: [:show, :edit, :update]
  before_action :is_matching_login_admin, only: [:index, :show, :edit, :update]

  def index
    @customers = Customer.all
    @customers = Customer.all.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      flash[:notice] = "プロフィールを更新しました。"
      redirect_to admin_customer_path(@customer)
    else
      flash[:alert] = "プロフィールの更新に失敗しました。"
      render :edit
    end
  end

  private
  def set_current_customer
    @customer = Customer.find(params[:id])
  end

  def is_matching_login_admin
    unless current_admin
      redirect_to root_path
    end
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :display_name, :email, :encrypted_password, :postal_code, :address, :telephone_number, :introduction, :is_active, :profile_image)
  end
end
