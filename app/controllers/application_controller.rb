class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecorfNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
