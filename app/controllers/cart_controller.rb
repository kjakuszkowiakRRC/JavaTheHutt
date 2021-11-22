class CartController < ApplicationController
    def create
        logger.debug("Adding #{params[:id]} to cart.")
        # product = Product.find(product_id)
        id = params[:id].to_i
        session[:shopping_cart] << id

        product = Product.find(id)
        flash[:notice] = " #{product.name} added to cart."

        redirect_to root_path

    end

    def destroy
        id = params[:id].to_i
        session[:shopping_cart].delete(id)

        product = Product.find(id)
        flash[:notice] = " #{product.name} removed from cart."

        redirect_to root_path

    end
end
