json.extract! product, :id, :product_name, :description, :image, :over_all_rating, :discount_available, :total_quantity, :available, :vendor_detail_id, :created_at, :updated_at
json.url product_url(product, format: :json)
