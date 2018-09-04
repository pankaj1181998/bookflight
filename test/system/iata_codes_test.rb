require "application_system_test_case"

class IataCodesTest < ApplicationSystemTestCase
  setup do
    @iata_code = iata_codes(:one)
  end

  test "visiting the index" do
    visit iata_codes_url
    assert_selector "h1", text: "Iata Codes"
  end

  test "creating a Iata code" do
    visit iata_codes_url
    click_on "New Iata Code"

    fill_in "Airport", with: @iata_code.airport
    fill_in "City", with: @iata_code.city
    fill_in "Code", with: @iata_code.code
    click_on "Create Iata code"

    assert_text "Iata code was successfully created"
    click_on "Back"
  end

  test "updating a Iata code" do
    visit iata_codes_url
    click_on "Edit", match: :first

    fill_in "Airport", with: @iata_code.airport
    fill_in "City", with: @iata_code.city
    fill_in "Code", with: @iata_code.code
    click_on "Update Iata code"

    assert_text "Iata code was successfully updated"
    click_on "Back"
  end

  test "destroying a Iata code" do
    visit iata_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Iata code was successfully destroyed"
  end
end
