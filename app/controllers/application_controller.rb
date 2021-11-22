class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :initialize_session
    helper_method :cart

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :province_id, :street_address)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password, :province_id, :street_address)}
         end

     private

     def initialize_session
          session[:shopping_cart] ||= []
     end

     def cart
          Product.find(session[:shopping_cart])
     end
end
