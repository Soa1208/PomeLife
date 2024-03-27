class Customers::SessionsController < Public::SessionsController
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to customer_path(customer), notice: "ゲストとしてログインしました。"
  end
end