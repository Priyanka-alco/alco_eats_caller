class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  require 'sendgrid-ruby'
  include SendGrid
  # skip_before_filter :authenticate_request
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def product_selling
    # render layout: true
    @result = {}
        product_id = params['product_id']
        start_time = Time.now
        product = Product.active_product
        res = []
        if product
          product.each do |val|
            product_detail = {}
            product_detail['product'] = val # product
            product_detail['vendor_detail'] = val.vendor_detail # vendor
            product_detail['discount_detail'] = val.discounts # discounts
            product_detail['product_detail'] = val.product_details # product_details
            res << product_detail
          end
          @result['status'] = 200
        else
          @result['status'] = 500
        end
        @result['product'] = res


    # puts "****#{@result['product']}"
        # render json: @result
  end
  def product_selling_detail
    order_id = params['order_id']
    get_order_detail = OrderDetail.where("order_id=#{order_id}")
    @result = []
    order = Order.where("id=#{order_id}")
    customer_id = order[0].cust_id
    customer_detail = Customer.where("id=#{customer_id}")
    @customer_detail = customer_detail
    # debugger
    @total_price = order[0].total
    get_order_detail.each_with_index do |val,index|
      res = {}
      res['order_detail']  = val
      # @result << {"total_price": order.total}
      # order_detail = Order.where("id=#{order_id}")
      product_id =   ( index==0) ? index+1 : index
      product_detail = Product.where("id=#{product_id}")
      res['product_name'] = product_detail[0].product_name
      @result << res
    end
  end
  def buy_product
    name = params['first_name']
    last_name = params['last_name']
    email_id = params['email']
    phone_no = params['phone_no']
    dob = params['dob']
    payment_type = params['payment_type']
    anniversary_date = params['anniversary_date']
    product_name = params['product_name']
    product_sku = params['sku']
    product_qty = params['qty']
    address = params['address']
    price = params['price']

    # total_price = price.sum{|val| val.to_i}
    create_customer = Customer.create(:first_name=>name, :last_name=>last_name,:email=>email_id,:phone=>phone_no,:address=>address)
    create_order = Order.create(:cust_id=>create_customer.id,
                                :seller_id=>1,
                                :total=>1500,
                                :status=>1,
                                :payment_type=>payment_type)
    puts "********#{create_customer.id}*********#{create_order.id}"
    product_name.each_with_index do |val,index|
      OrderDetail.create(:sku_id=>product_sku["#{index}"],:order_id=>create_order.id,:quantity=>product_qty["#{index}"],:selling_price=>price["#{index}"],:status=>1)
    end
    redirect_to '/order'

  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def card_details

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:product_name, :description, :image, :over_all_rating, :discount_available, :total_quantity, :available, :vendor_detail_id)
    end
end
