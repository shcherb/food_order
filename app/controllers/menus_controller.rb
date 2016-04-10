class MenusController < ApplicationController
  #skip_before_filter :authenticate_user!, :only => [:order]
  before_action :set_menu, only: [:dishes, :order, :compose, :show, :edit, :update, :destroy]

  # GET /menus/1/dishes
  def dishes
    @dishes = Dish.all
  end

  # GET /menus/1/order
  def order
    @dishes = @menu.dishes
    @categories = @dishes.select(:category_id).group(:category_id)
    render layout: false
  end

  # GET /menus
  # GET /menus.json
  def index
    @menus = current_user.menus
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @categories = @menu.dishes.select(:category_id).group(:category_id)
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = current_user.menus.create(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /menues/1/compose
  def compose
    @menu.dishes.clear
    @menu.dish_ids = params[:dish_ids].map {|i| i.to_i}
    respond_to do |format|
      format.html { redirect_to dishes_menu_path(id: @menu.id), notice: 'Menu was successfully composed.' }
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
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
