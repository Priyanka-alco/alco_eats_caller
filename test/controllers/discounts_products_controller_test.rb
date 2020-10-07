require 'test_helper'

class DiscountsProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discounts_product = discounts_products(:one)
  end

  test "should get index" do
    get discounts_products_url
    assert_response :success
  end

  test "should get new" do
    get new_discounts_product_url
    assert_response :success
  end

  test "should create discounts_product" do
    assert_difference('DiscountsProduct.count') do
      post discounts_products_url, params: { discounts_product: { discount_id: @discounts_product.discount_id, product_id: @discounts_product.product_id, status: @discounts_product.status } }
    end

    assert_redirected_to discounts_product_url(DiscountsProduct.last)
  end

  test "should show discounts_product" do
    get discounts_product_url(@discounts_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_discounts_product_url(@discounts_product)
    assert_response :success
  end

  test "should update discounts_product" do
    patch discounts_product_url(@discounts_product), params: { discounts_product: { discount_id: @discounts_product.discount_id, product_id: @discounts_product.product_id, status: @discounts_product.status } }
    assert_redirected_to discounts_product_url(@discounts_product)
  end

  test "should destroy discounts_product" do
    assert_difference('DiscountsProduct.count', -1) do
      delete discounts_product_url(@discounts_product)
    end

    assert_redirected_to discounts_products_url
  end
end
