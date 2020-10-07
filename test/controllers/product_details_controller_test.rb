require 'test_helper'

class ProductDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_detail = product_details(:one)
  end

  test "should get index" do
    get product_details_url
    assert_response :success
  end

  test "should get new" do
    get new_product_detail_url
    assert_response :success
  end

  test "should create product_detail" do
    assert_difference('ProductDetail.count') do
      post product_details_url, params: { product_detail: { category: @product_detail.category, cost_price: @product_detail.cost_price, delivery_date: @product_detail.delivery_date, discount_amount: @product_detail.discount_amount, discount_id: @product_detail.discount_id, discount_percentage: @product_detail.discount_percentage, exchange_available: @product_detail.exchange_available, gst: @product_detail.gst, product_id: @product_detail.product_id, quantity: @product_detail.quantity, replace: @product_detail.replace, selling_rice: @product_detail.selling_rice, sku: @product_detail.sku, status: @product_detail.status } }
    end

    assert_redirected_to product_detail_url(ProductDetail.last)
  end

  test "should show product_detail" do
    get product_detail_url(@product_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_detail_url(@product_detail)
    assert_response :success
  end

  test "should update product_detail" do
    patch product_detail_url(@product_detail), params: { product_detail: { category: @product_detail.category, cost_price: @product_detail.cost_price, delivery_date: @product_detail.delivery_date, discount_amount: @product_detail.discount_amount, discount_id: @product_detail.discount_id, discount_percentage: @product_detail.discount_percentage, exchange_available: @product_detail.exchange_available, gst: @product_detail.gst, product_id: @product_detail.product_id, quantity: @product_detail.quantity, replace: @product_detail.replace, selling_rice: @product_detail.selling_rice, sku: @product_detail.sku, status: @product_detail.status } }
    assert_redirected_to product_detail_url(@product_detail)
  end

  test "should destroy product_detail" do
    assert_difference('ProductDetail.count', -1) do
      delete product_detail_url(@product_detail)
    end

    assert_redirected_to product_details_url
  end
end
