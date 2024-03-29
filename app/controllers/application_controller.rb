class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_customers_path
    elsif resource.is_a?(Customer)
      customer_path(resource)
    else
      root_path
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana,:last_name_kana,:display_name, :postal_code, :address, :telephone_number])
  end
end
