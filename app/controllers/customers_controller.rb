class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  def search_customer
    @result = {}
    phone_number = params['phone_number']
    if phone_number.present?
      customer_detail = Customer.where("phone='#{phone_number}'")
      if customer_detail
        @result['status'] = 200
        @result['customer_detail'] = customer_detail
        @result['order_detail'] = Order.where("cust_id=#{customer_detail[0].id}").order( 'id DESC' )
      else
        @result['redirect_to'] = '/product_selling'
        @result['status'] = 300
      end
    end
  end

  def search_by_phone
    result = {}
    phone_number = params['phone_number']
    customer_detail = Customer.where("phone='#{phone_number}'")
    if customer_detail
      result['status'] = 200
      result['customer_detail'] = customer_detail
      result['order_detail'] = Order.where("cust_id=#{customer_detail[0].id}").order( 'id DESC' )
    else
      result['redirect_to'] = '/product_selling'
      result['status'] = 300
    end
    render :json=> result
  end

  def edit_customer_detail
    cust_first_name = params['cust_first_name']
    cust_last_name = params['cust_last_name']
    cust_address = params['cust_address']
    cust_phone = params['cust_phone']
    customer_detail = Customer.where("phone='#{cust_phone}'")

    customer_detail[0].first_name = cust_first_name
    customer_detail[0].last_name = cust_last_name
    customer_detail[0].address = cust_address
    result = (customer_detail[0].save!) ? true :false
    render :json=>result
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :phone, :address, :country, :state, :city, :pincode, :status)
    end
end
