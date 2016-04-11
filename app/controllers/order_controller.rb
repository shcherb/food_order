class OrderController < CorsController #ApplicationController
  before_action :set_menu

  # GET /order
  def index
    @cart = current_cart
    @dishes = @menu.dishes
    @categories = @dishes.select(:category_id).distinct
    render layout: false
  end

  private

  def set_menu
    @menu = current_menu
  end

end
