class CardDetailsController < ApplicationController
  before_action :set_card_detail, only: [:show, :edit, :update, :destroy]

  # GET /card_details
  # GET /card_details.json
  def index
    @card_details = CardDetail.all
  end

  # GET /card_details/1
  # GET /card_details/1.json
  def show
  end

  # GET /card_details/new
  def new
    @card_detail = CardDetail.new
  end

  # GET /card_details/1/edit
  def edit
  end

  # POST /card_details
  # POST /card_details.json
  def create
    @card_detail = CardDetail.new(card_detail_params)

    respond_to do |format|
      if @card_detail.save
        format.html { redirect_to @card_detail, notice: 'Card detail was successfully created.' }
        format.json { render :show, status: :created, location: @card_detail }
      else
        format.html { render :new }
        format.json { render json: @card_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_details/1
  # PATCH/PUT /card_details/1.json
  def update
    respond_to do |format|
      if @card_detail.update(card_detail_params)
        format.html { redirect_to @card_detail, notice: 'Card detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_detail }
      else
        format.html { render :edit }
        format.json { render json: @card_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_details/1
  # DELETE /card_details/1.json
  def destroy
    @card_detail.destroy
    respond_to do |format|
      format.html { redirect_to card_details_url, notice: 'Card detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_detail
      @card_detail = CardDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_detail_params
      params.require(:card_detail).permit(:cust_id, :card_number, :expiry_date, :cvc_code, :cardholder_name, :status)
    end
end
