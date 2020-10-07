json.extract! discount, :id, :discount_code, :no_of_coupon, :valid_from, :valid_to, :minimum_order_value, :discount_amount, :auto_apply, :status, :created_at, :updated_at
json.url discount_url(discount, format: :json)
