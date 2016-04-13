class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :confirm]
  before_action :cart_params, only: [:add_dish, :delete_dish]
  #respond_to :html, :json

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    render layout: false
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts/1/confirm
  def confirm
    session.delete(:cart_id)
    respond_to do |format|
      if @cart.dishes.empty?
        format.html { redirect_to @cart, notice: 'Is nothing to send. Cart is empty.' }
        format.json { render json: "Is nothing to send. Cart is empty.", status: :not_modified}
      end
      if (params[:phone].empty?) && (params[:email].empty?)
        format.html { redirect_to @cart, notice: 'Please, fill phone field or email field.' }
        format.json { render json: "phone or email is needed", status: :not_modified}
      else
        FoodOrderMailer.order_email(current_user, params[:phone], params[:email], @cart).deliver_now
        format.html { redirect_to order_path, notice: 'Your order was successfully sent. You may do one more.' }
        format.json { render json: "success", status: :ok}
      end
    end
  end

  #
  def add_dish
    @cart_dish = CartsDish.new({cart_id: @cart.id, dish_id: @dish.id})
    respond_to do |format|
      if @cart_dish.save
        @count = @cart.dishes.where('dish_id = ?', @dish.id).count
        format.js {}
        format.json { render json: @cart, status: :created}
      else
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  #
  def delete_dish
    CartsDish.where('cart_id = ? AND dish_id = ?', @cart.id, @dish.id).first.destroy
    @count = CartsDish.where('cart_id = ? AND dish_id = ?', @cart.id, @dish.id).count
    respond_to do |format|
      format.js {}
      format.json { render json: "success", status: :ok}
    end
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Cart was successfully cleaned.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.permit(:phone, :email, :dish_id, :authenticity_token, :format)
      @cart = current_cart
      @dish = Dish.find(params[:dish_id])
    end
end
