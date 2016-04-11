class OrderController < CorsController #ApplicationController
  before_action :set_menu, only: [:index]

  # GET /order
  def index
    @cart = current_cart
    @dishes = @menu.dishes
    @categories = @dishes.select(:category_id).distinct
    render layout: false
  end

  private

  def set_menu
    if @menu.nil?
      @menu = Menu.find(sessin[:menu_id])
    end
  end

end
