require "application_system_test_case"

class ShootingsTest < ApplicationSystemTestCase
  setup do
    @shooting = shootings(:one)
  end

  test "visiting the index" do
    visit shootings_url
    assert_selector "h1", text: "Shootings"
  end

  test "creating a Shooting" do
    visit shootings_url
    click_on "New Shooting"

    fill_in "Location", with: @shooting.location
    fill_in "Vehicle", with: @shooting.vehicle
    fill_in "Weapon", with: @shooting.weapon
    click_on "Create Shooting"

    assert_text "Shooting was successfully created"
    click_on "Back"
  end

  test "updating a Shooting" do
    visit shootings_url
    click_on "Edit", match: :first

    fill_in "Location", with: @shooting.location
    fill_in "Vehicle", with: @shooting.vehicle
    fill_in "Weapon", with: @shooting.weapon
    click_on "Update Shooting"

    assert_text "Shooting was successfully updated"
    click_on "Back"
  end

  test "destroying a Shooting" do
    visit shootings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shooting was successfully destroyed"
  end
end
