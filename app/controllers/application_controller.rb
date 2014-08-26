class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include CurrentCart

  before_action :cart

  def cart
    @cart ||= Cart.find(session[:cart_id]) if session[:cart_id]
  end
end
