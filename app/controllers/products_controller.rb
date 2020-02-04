class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by_id(params[:id])
    if @product.nil?
      # TODO: If no products are found simply display
      # An option to create a new product
      flash[:error] = "No products found"
    end
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    # Validate data and add to the price manager
    if @product.valid?
      @product.save
      create_prices(@product.id, @product.scrape_price, "CAD")
      $price_manager.add_product(@product)
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :url, :notes)
    end
end
