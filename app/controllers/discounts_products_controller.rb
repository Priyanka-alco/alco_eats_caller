class DiscountsProductsController < ApplicationController
  before_action :set_discounts_product, only: [:show, :edit, :update, :destroy]

  # GET /discounts_products
  # GET /discounts_products.json
  def index
    @discounts_products = DiscountsProduct.all
  end

  # GET /discounts_products/1
  # GET /discounts_products/1.json
  def show
  end

  # GET /discounts_products/new
  def new
    @discounts_product = DiscountsProduct.new
  end

  # GET /discounts_products/1/edit
  def edit
  end

  # POST /discounts_products
  # POST /discounts_products.json
  def create
    @discounts_product = DiscountsProduct.new(discounts_product_params)

    respond_to do |format|
      if @discounts_product.save
        format.html { redirect_to @discounts_product, notice: 'Discounts product was successfully created.' }
        format.json { render :show, status: :created, location: @discounts_product }
      else
        format.html { render :new }
        format.json { render json: @discounts_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discounts_products/1
  # PATCH/PUT /discounts_products/1.json
  def update
    respond_to do |format|
      if @discounts_product.update(discounts_product_params)
        format.html { redirect_to @discounts_product, notice: 'Discounts product was successfully updated.' }
        format.json { render :show, status: :ok, location: @discounts_product }
      else
        format.html { render :edit }
        format.json { render json: @discounts_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discounts_products/1
  # DELETE /discounts_products/1.json
  def destroy
    @discounts_product.destroy
    respond_to do |format|
      format.html { redirect_to discounts_products_url, notice: 'Discounts product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discounts_product
      @discounts_product = DiscountsProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discounts_product_params
      params.require(:discounts_product).permit(:discount_id, :product_id, :status)
    end
end
