require 'test_helper'

class IataCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @iata_code = iata_codes(:one)
  end

  test "should get index" do
    get iata_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_iata_code_url
    assert_response :success
  end

  test "should create iata_code" do
    assert_difference('IataCode.count') do
      post iata_codes_url, params: { iata_code: { airport: @iata_code.airport, city: @iata_code.city, code: @iata_code.code } }
    end

    assert_redirected_to iata_code_url(IataCode.last)
  end

  test "should show iata_code" do
    get iata_code_url(@iata_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_iata_code_url(@iata_code)
    assert_response :success
  end

  test "should update iata_code" do
    patch iata_code_url(@iata_code), params: { iata_code: { airport: @iata_code.airport, city: @iata_code.city, code: @iata_code.code } }
    assert_redirected_to iata_code_url(@iata_code)
  end

  test "should destroy iata_code" do
    assert_difference('IataCode.count', -1) do
      delete iata_code_url(@iata_code)
    end

    assert_redirected_to iata_codes_url
  end
end
