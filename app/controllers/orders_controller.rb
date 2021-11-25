# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :total_price_order
  def total_price_order
    @total_product_price = 0
    @total_taxes = 0
    @total_price = 0
    @order_product_ids = []
    @order_product_prices = []
    @order_product_quantities = []
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    product_list.each do |product|
      OrderProduct.create(order: @order, product: product, bought_price: product.price,
                          quantity: session[:shopping_cart][product.id.to_s].to_i)
    end

    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(update_order_params)
      redirect_to @order
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:price, :tax_amount)
  end

  def update_order_params
    params.require(:product).permit(:name, :price, :variety_id, on_sale: [:test])
  end

  def product_list
    full_order_params = {}.merge(order_params)
    full_order_params.store("status", "NEW")
    @user = User.find(current_user.id)
    @order = @user.orders.create(full_order_params)

    products = []
    session[:shopping_cart].each do |key|
      products << key
    end
    Product.find(products)
  end
end
