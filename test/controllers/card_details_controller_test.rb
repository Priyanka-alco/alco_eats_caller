require 'test_helper'

class CardDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_detail = card_details(:one)
  end

  test "should get index" do
    get card_details_url
    assert_response :success
  end

  test "should get new" do
    get new_card_detail_url
    assert_response :success
  end

  test "should create card_detail" do
    assert_difference('CardDetail.count') do
      post card_details_url, params: { card_detail: { card_number: @card_detail.card_number, cardholder_name: @card_detail.cardholder_name, cust_id: @card_detail.cust_id, cvc_code: @card_detail.cvc_code, expiry_date: @card_detail.expiry_date, status: @card_detail.status } }
    end

    assert_redirected_to card_detail_url(CardDetail.last)
  end

  test "should show card_detail" do
    get card_detail_url(@card_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_detail_url(@card_detail)
    assert_response :success
  end

  test "should update card_detail" do
    patch card_detail_url(@card_detail), params: { card_detail: { card_number: @card_detail.card_number, cardholder_name: @card_detail.cardholder_name, cust_id: @card_detail.cust_id, cvc_code: @card_detail.cvc_code, expiry_date: @card_detail.expiry_date, status: @card_detail.status } }
    assert_redirected_to card_detail_url(@card_detail)
  end

  test "should destroy card_detail" do
    assert_difference('CardDetail.count', -1) do
      delete card_detail_url(@card_detail)
    end

    assert_redirected_to card_details_url
  end
end
