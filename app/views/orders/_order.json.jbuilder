json.extract! order, :id, :cust_id, :total, :discount_id, :seller_id, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
