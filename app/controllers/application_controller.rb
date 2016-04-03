class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :cors_preflight_check
  acts_as_token_authentication_handler_for User
  before_filter :authenticate_user!
  after_filter :cors_set_access_control_headers

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecorfNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def cors_set_access_control_headers
    headers["Access-Control-Allow-Origin"]  = '*'
    headers["Access-Control-Allow-Methods"] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers["Access-Control-Allow-Headers"] = 'Origin, Accept, Content-Type, Authorization, Token'
    headers["Access-Control-Max-Age"] = '1700000'
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1700000'
    end
  end
end
