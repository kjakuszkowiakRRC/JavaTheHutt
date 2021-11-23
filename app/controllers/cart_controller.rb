class CartController < ApplicationController
    def create
        logger.debug("Adding #{params[:id]} to cart.")
        # product = Product.find(product_id)
        id = params[:id].to_i
        session[:shopping_cart].store(id, params[:quantity])

        product = Product.find(id)
        flash[:notice] = "#{session[:shopping_cart][id]} #{product.name} added to cart."

        redirect_to root_path

    end

    def destroy
        id = params[:id].to_i
        if params[:quantity].to_i > 0
            session[:shopping_cart][id] = params[:quantity].to_i - 1
        else

        end
        session[:shopping_cart].delete(params[:id])

        product = Product.find(id)
        flash[:notice] = " #{product.name} removed from cart."

        redirect_to root_path

    end

    def update_quantity
        session[:shopping_cart].delete(params[:id])
        id = params[:id].to_i

        product = Product.find(id)
        session[:shopping_cart][id] = params[:quantity]
        flash[:notice] = " Quantity of #{product.name} changed to #{params[:quantity]}."

        redirect_to root_path
    end
end
