require 'test_helper'

class PaytmDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paytm_detail = paytm_details(:one)
  end

  test "should get index" do
    get paytm_details_url
    assert_response :success
  end

  test "should get new" do
    get new_paytm_detail_url
    assert_response :success
  end

  test "should create paytm_detail" do
    assert_difference('PaytmDetail.count') do
      post paytm_details_url, params: { paytm_detail: { cust_id: @paytm_detail.cust_id, phone_number: @paytm_detail.phone_number, status: @paytm_detail.status } }
    end

    assert_redirected_to paytm_detail_url(PaytmDetail.last)
  end

  test "should show paytm_detail" do
    get paytm_detail_url(@paytm_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_paytm_detail_url(@paytm_detail)
    assert_response :success
  end

  test "should update paytm_detail" do
    patch paytm_detail_url(@paytm_detail), params: { paytm_detail: { cust_id: @paytm_detail.cust_id, phone_number: @paytm_detail.phone_number, status: @paytm_detail.status } }
    assert_redirected_to paytm_detail_url(@paytm_detail)
  end

  test "should destroy paytm_detail" do
    assert_difference('PaytmDetail.count', -1) do
      delete paytm_detail_url(@paytm_detail)
    end

    assert_redirected_to paytm_details_url
  end
end
