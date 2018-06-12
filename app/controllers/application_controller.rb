class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?

	before_action :categories, :brands

	rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.product_url, :alert => "Not authorized!" }
    end
  end

  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

#Our category and brand methods are below

	def categories
		@categories = Category.order(:name)
	end

	def brands
		@brands = Product.pluck(:brand).sort.uniq
	end

	protected

	def configure_permitted_parameters
	   devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
	   devise_parameter_sanitizer.permit(:account_update, keys: [:role])
	end
end
