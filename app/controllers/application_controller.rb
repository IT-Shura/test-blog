class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception| 
    redirect_to root_url, :notice => exception.message
  end

  def current_user
    super || guest_user
  end

  private

  def guest_user
    User.find(session[:guest_user_id].nil? ? session[:guest_user_id] = create_guest_user.id : session[:guest_user_id])
  end

  def create_guest_user
    user = User.new
    user.name  = "guest_#{Time.now.to_i}#{rand(99)}"
    user.email = user.name + "@example.com"
    user.save(:validate => false)
    user.add_role :visitor
    user
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
