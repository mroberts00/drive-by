require 'test_helper'

class ShootingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shooting = shootings(:one)
  end

  test "should get index" do
    get shootings_url
    assert_response :success
  end

  test "should get new" do
    get new_shooting_url
    assert_response :success
  end

  test "should create shooting" do
    assert_difference('Shooting.count') do
      post shootings_url, params: { shooting: { location: @shooting.location, vehicle: @shooting.vehicle, weapon: @shooting.weapon } }
    end

    assert_redirected_to shooting_url(Shooting.last)
  end

  test "should show shooting" do
    get shooting_url(@shooting)
    assert_response :success
  end

  test "should get edit" do
    get edit_shooting_url(@shooting)
    assert_response :success
  end

  test "should update shooting" do
    patch shooting_url(@shooting), params: { shooting: { location: @shooting.location, vehicle: @shooting.vehicle, weapon: @shooting.weapon } }
    assert_redirected_to shooting_url(@shooting)
  end

  test "should destroy shooting" do
    assert_difference('Shooting.count', -1) do
      delete shooting_url(@shooting)
    end

    assert_redirected_to shootings_url
  end
end
