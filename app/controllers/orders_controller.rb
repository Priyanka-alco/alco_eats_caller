class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  def payment
    card_number = params['card_number']
    expiry_date = params['expiry_date']
    cvc = params['cvc']
    card_holder_name = params['card_holder_name']
    payment_method = params['payment_method']
    cust_id = params['cust_id']
    order_id = params['order_id']
    if payment_method == "1"
      # (pay via card)
      create_card = CardDetail.create(:card_number => card_number,
                        :expiry_date => expiry_date,
                        :cvc_code => cvc,
                        :cardholder_name => card_holder_name,
                        :cust_id => cust_id)

    else
      # (pay via paytm)
    end
    order_id = params['order_id']
    order_status = 3
    get_order = Order.where("id=#{order_id}")
    get_order_detail = OrderDetail.where("order_id=#{order_id}")
    get_order[0].status = order_status
    get_order[0].save!
    get_order_detail.each do |order_detail|
      order_detail.status = order_status
      order_detail.save!
    end
    redirect_to '/payment_acknowledgement'
  end

  def payment_acknowledgement

  end

  def customer_payment_page
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

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  def order
    seller = session[:admin] != true ? User.where("email='#{session[:email_id]}' and status =1") :  User.where("status =1")
    order_detail = Order.where("seller_id=#{seller[0].id}").order( 'id DESC' )

    @res = []
    order_detail.each do |val|

      result = {}
      result['order_detail'] = val
      customer_detail = Customer.where("id=#{val.cust_id}")
      result['customer_detail'] = customer_detail
      @res << result
    end

  end
  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:cust_id, :total, :discount_id, :seller_id, :status)
    end
end
