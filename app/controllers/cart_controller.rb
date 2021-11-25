class CartController < ApplicationController
  def create
    add_product_to_cart
    redirect_to root_path
  end

  def destroy
    delete_product_from_cart
    redirect_to root_path
  end

  def update_quantity
    update_product_in_cart
    redirect_to root_path
  end

  private

  def find_product(id)
    Product.find(id)
  end

  def find_id
    params[:id].to_i
  end

  def change_quantity
    return unless params[:quantity].to_i.positive?

    session[:shopping_cart][find_id] =
      params[:quantity].to_i - 1
  end
end

def add_product_to_cart
  id = params[:id].to_i
  session[:shopping_cart].store(id, params[:quantity])
  flash[:notice] = "#{session[:shopping_cart][id]} #{find_product(id).name} added to cart."
end

def delete_product_from_cart
  change_quantity
  session[:shopping_cart].delete(params[:id])
  flash[:notice] = " #{find_product(id).name} removed from cart."
end

def update_product_in_cart
  session[:shopping_cart].delete(params[:id])
  session[:shopping_cart][find_id] = params[:quantity]
  flash[:notice] = " Quantity of #{find_product(id).name} changed to #{params[:quantity]}."
end
