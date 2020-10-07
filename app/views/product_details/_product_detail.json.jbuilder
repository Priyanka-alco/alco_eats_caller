json.extract! product_detail, :id, :product_id, :sku, :category, :selling_rice, :cost_price, :gst, :discount_id, :discount_amount, :discount_percentage, :quantity, :exchange_available, :replace, :status, :delivery_date, :created_at, :updated_at
json.url product_detail_url(product_detail, format: :json)
