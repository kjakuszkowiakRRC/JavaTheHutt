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
      full_order_params = {}.merge(order_params)
      full_order_params.store("status", "NEW")
      @user = User.find(current_user.id)
      @order = @user.orders.create(full_order_params)
      flash[:notice] = " THIS IS A TEST:  #{@order_product_ids}"

      products = []
      session[:shopping_cart].each do |key, value|
           products << key
         end
         product_list = Product.find(products)

         puts("TEST: #{product_list}")
      product_list.each do |product|
        # @product = Product.find(product_id[test])
        # @order.products << product

        OrderProduct.create(order: @order, product: product, bought_price: product.price, quantity: session[:shopping_cart][product.id.to_s].to_i)
        # @order.order_products.create(product: product, bought_price: product.price, quantity: session[:shopping_cart][product.id.to_s].to_i, returned: true)
      end

      #add create loop for order_products with array of product_ids
      # redirect_to product_path(@product)
      # redirect_to variety_path(@variety)
      # @product = Product.new(product_params)

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

    private
        def update_order_params
            params.require(:product).permit(:name, :price, :variety_id, :on_sale => [:test])
        end
    # add a function to loop through all orders depending on user_id kind of like index
end
