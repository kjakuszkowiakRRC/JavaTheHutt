# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order(:name).page params[:page]
  end

  def filter
    @products = case params[:filter]
                when "On Sale"
                  Product.where("on_sale = 2")
                when "Recently Updated"
                  Product.where("updated_at > #{Time.zone.today - 1}")
                else
                  Product.all
                end
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @products = if params[:search_filter]
                  Product.where("name LIKE ? OR description LIKE ? AND variety_id = ?",
                                wildcard_search, wildcard_search, params[:search_filter])
                else
                  Product.where("name LIKE ? OR description LIKE ?", wildcard_search,
                                wildcard_search)
                end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @variety = Variety.find(params[:product][:variety_id])
    @product = @variety.products.create(product_params)

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(update_product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end

  def update_product_params
    params.require(:product).permit(:name, :price, :variety_id, :on_sale)
  end

  def temp_variety_id
    rand(4)
  end
end
