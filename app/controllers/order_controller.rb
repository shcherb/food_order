class OrderController < CorsController
  #before_action :set_menu, only: [:dishes, :order, :compose, :show, :edit, :update, :destroy]

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
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:category, :name, :description, :price, :photo, :dish_ids)
    end
end
