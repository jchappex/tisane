class StoreController < ApplicationController
  skip_before_action :authorize
  skip_before_action :admin_only
  def index
    @products = Product.order(:title)
    @type1 = @products.where(:product_line =>"1")
    @type2 = @products.where(:product_line =>"2")
  end
  def update
    @line_item = LineItem.find(params[:id])
  end
  def create
    set_quantity = @line_item.quantity
  end
end
