class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product_prices = {}
    @products.each do |product|
      @product_prices[product.id] = product_prices(product)
    end
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
      # Publish to Kafka products topic for price processing
      $kafka_producer.produce({"id":@product.id, "currency": "CAD"}.to_json, topic: "products", partition_key: "prod_test")
      $kafka_producer.deliver_messages
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

  def table
    @products = Product.find(params[:id])
  end

  private
    def product_params
      params.require(:product).permit(:name, :url, :notes)
    end

    def product_prices(product)
      return {
        "current" => product.current_price,
        "max" => product.max_price,
        "min" => product.min_price }
    end
end
