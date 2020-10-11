class PaytmDetailsController < ApplicationController
  before_action :set_paytm_detail, only: [:show, :edit, :update, :destroy]

  # GET /paytm_details
  # GET /paytm_details.json
  def index
    @paytm_details = PaytmDetail.all
  end

  # GET /paytm_details/1
  # GET /paytm_details/1.json
  def show
  end

  # GET /paytm_details/new
  def new
    @paytm_detail = PaytmDetail.new
  end

  # GET /paytm_details/1/edit
  def edit
  end

  # POST /paytm_details
  # POST /paytm_details.json
  def create
    @paytm_detail = PaytmDetail.new(paytm_detail_params)

    respond_to do |format|
      if @paytm_detail.save
        format.html { redirect_to @paytm_detail, notice: 'Paytm detail was successfully created.' }
        format.json { render :show, status: :created, location: @paytm_detail }
      else
        format.html { render :new }
        format.json { render json: @paytm_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paytm_details/1
  # PATCH/PUT /paytm_details/1.json
  def update
    respond_to do |format|
      if @paytm_detail.update(paytm_detail_params)
        format.html { redirect_to @paytm_detail, notice: 'Paytm detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @paytm_detail }
      else
        format.html { render :edit }
        format.json { render json: @paytm_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paytm_details/1
  # DELETE /paytm_details/1.json
  def destroy
    @paytm_detail.destroy
    respond_to do |format|
      format.html { redirect_to paytm_details_url, notice: 'Paytm detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paytm_detail
      @paytm_detail = PaytmDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paytm_detail_params
      params.require(:paytm_detail).permit(:phone_number, :cust_id, :status)
    end
end
