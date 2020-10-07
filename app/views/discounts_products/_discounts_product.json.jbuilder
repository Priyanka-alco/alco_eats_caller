json.extract! discounts_product, :id, :discount_id, :product_id, :status, :created_at, :updated_at
json.url discounts_product_url(discounts_product, format: :json)
