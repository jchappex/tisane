class OrdersController < ApplicationController
  include CurrentCart
  skip_before_action :admin_only, only: [:new, :create]
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    if @cart.line_items.empty?
      redirect_to store_url, notice:"Your cart is empty"
      return
    end
      @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  def summary
  end
  
  def confirm_pay
  end

  def cancel_pay
  end

  # POST /orders
  # POST /orders.json
  def create
    @cart = Cart.find(session[:cart_id])
    values = {
      business: "merchant@gotealeaf.com",
      cmd: "_cart",
      upload: '2',
      return: "https://tisane-jovien1.c9users.io/confirm/pay",
      cancel_return: "https://tisane-jovien1.c9users.io/cancel/pay",
      currency_code: 'EUR',
    }
    @cart.line_items.each_with_index do |l, i|
      values["item_name_#{i+1}"] = l.product.title
      values["amount_#{i+1}"] = l.product.price.to_f
      values["quantity_#{i+1}"] = l.quantity
    end
    redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def paypal_checkout
    @cart = Cart.find(session[:cart_id])
    values = {
      business: "merchant@gotealeaf.com",
      cmd: "_cart",
      upload: '2',
      return: "https://tisane-jovien1.c9users.io/confirm/pay",
      currency_code: 'EUR',
    }
    @cart.line_items.each_with_index do |l, i|
      values["item_name_#{i+1}"] = l.product.title
      values["amount_#{i+1}"] = l.product.price.to_f
      values["quantity_#{i+1}"] = l.quantity
    end
    redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end
end
