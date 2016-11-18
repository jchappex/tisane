class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  before_action :authorize
  before_action :admin_only
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
  helper_method :current_cart

  def current_user
    User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    user = User.create
    session[:user_id] = user.id
    user
  end
  helper_method :current_user

protected

def set_i18n_locale_from_params
  if params[:locale]
    if I18n.available_locales.map(&:to_s).include?(params[:locale])
      I18n.locale = params[:locale]
    else
      flash.now[:notice] = "#{params[:locale]} translation not available"
      logger.error flash.now[:notice]
    end
  end
end
def default_url_options
  {locale: I18n.locale}
end

def admin_only
  unless current_user.admin == true
    redirect_to showcase_url, notice: "Please log in"
  end
end
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
end
