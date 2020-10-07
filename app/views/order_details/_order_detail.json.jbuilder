json.extract! order_detail, :id, :order_id, :sku_id, :quantity, :discount_id, :selling_price, :status, :created_at, :updated_at
json.url order_detail_url(order_detail, format: :json)
