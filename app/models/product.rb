class Product < ApplicationRecord
  belongs_to :vendor_detail
  has_and_belongs_to_many :discounts
  has_many :product_details


  def self.active_product
    return Product.where("available=1")
  end
end
