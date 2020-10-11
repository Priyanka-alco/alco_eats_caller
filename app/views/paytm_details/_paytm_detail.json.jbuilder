json.extract! paytm_detail, :id, :phone_number, :cust_id, :status, :created_at, :updated_at
json.url paytm_detail_url(paytm_detail, format: :json)
