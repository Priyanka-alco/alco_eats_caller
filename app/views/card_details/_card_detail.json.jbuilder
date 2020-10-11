json.extract! card_detail, :id, :cust_id, :card_number, :expiry_date, :cvc_code, :cardholder_name, :status, :created_at, :updated_at
json.url card_detail_url(card_detail, format: :json)
