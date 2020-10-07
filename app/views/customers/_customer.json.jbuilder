json.extract! customer, :id, :first_name, :last_name, :email, :phone, :address, :country, :state, :city, :pincode, :status, :created_at, :updated_at
json.url customer_url(customer, format: :json)
