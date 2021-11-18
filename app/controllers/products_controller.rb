class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @variety = Variety.find(rand(23..27))
    # @variety = Variety.find(params[:variety_id])
    @product = @variety.products.create(product_params)
    # redirect_to product_path(@product)
    # redirect_to variety_path(@variety)
    # @product = Product.new(product_params)

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

    if @product.update(product_params)
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

    private
      def temp_variety_id
        rand(4)
      end
end
