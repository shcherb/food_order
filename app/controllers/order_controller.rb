class OrderController < CorsController #ApplicationController
  before_filter :set_menu, only: [:index]

  # GET /order
  def index
    @cart = current_cart
    if @menu.nil?
      #session.delete(:menu_id)
      respond_to do |format|
        format.html { redirect_to signout_path, status: :forbiddenn, notice: 'You have not access to service from this URL.' }
      end

      #head :forbidden
    else
      @dishes = @menu.dishes
      @categories = @dishes.select(:category_id).distinct
      render layout: false
    end
  end

  private

  def set_menu
    @menu = current_user.menus.find_by_url(request.env['HTTP_REFERER'])  # HTTP_ORIGIN
    if @menu.nil?
      pattern = /^(\w+):\/\/([\w\.]+).[\d\.]*/
      @menu = Menu.find_by_url(request.env['HTTP_REFERER'].slice(pattern))
    else
      session[:menu_id] = @menu.id
      return
    end
    @menu = current_menu
  end

end
