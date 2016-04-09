class OrderController < ApplicationController #CorsController
  before_action :order_params
  before_action :set_menu, only: [:index]

  # GET /order
  # GET /order.json
  def index
    @cart = current_cart
    @dishes = @menu.dishes
    @categories = @dishes.select(:category_id).distinct
    render layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:menu_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.permit(:menu_id)
    end
end
