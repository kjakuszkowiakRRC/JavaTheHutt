class OrdersController < ApplicationController
    def show
      @order = Order.find(params[:id])
    end

    def new
      @order = Order.new
    end

    def create
      @user = User.find([:user_id])
      # @variety = Variety.find(params[:variety_id])
      @order = @user.orders.create(order_params)
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
      def product_params
        params.require(:product).permit(:name, :price)
      end
    private
        def update_order_params
            params.require(:product).permit(:name, :price, :variety_id, :on_sale)
        end
    # add a function to loop through all orders depending on user_id kind of like index
end
