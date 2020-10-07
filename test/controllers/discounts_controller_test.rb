require 'test_helper'

class DiscountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discount = discounts(:one)
  end

  test "should get index" do
    get discounts_url
    assert_response :success
  end

  test "should get new" do
    get new_discount_url
    assert_response :success
  end

  test "should create discount" do
    assert_difference('Discount.count') do
      post discounts_url, params: { discount: { auto_apply: @discount.auto_apply, discount_amount: @discount.discount_amount, discount_code: @discount.discount_code, minimum_order_value: @discount.minimum_order_value, no_of_coupon: @discount.no_of_coupon, status: @discount.status, valid_from: @discount.valid_from, valid_to: @discount.valid_to } }
    end

    assert_redirected_to discount_url(Discount.last)
  end

  test "should show discount" do
    get discount_url(@discount)
    assert_response :success
  end

  test "should get edit" do
    get edit_discount_url(@discount)
    assert_response :success
  end

  test "should update discount" do
    patch discount_url(@discount), params: { discount: { auto_apply: @discount.auto_apply, discount_amount: @discount.discount_amount, discount_code: @discount.discount_code, minimum_order_value: @discount.minimum_order_value, no_of_coupon: @discount.no_of_coupon, status: @discount.status, valid_from: @discount.valid_from, valid_to: @discount.valid_to } }
    assert_redirected_to discount_url(@discount)
  end

  test "should destroy discount" do
    assert_difference('Discount.count', -1) do
      delete discount_url(@discount)
    end

    assert_redirected_to discounts_url
  end
end
