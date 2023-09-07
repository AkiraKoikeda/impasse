# frozen_string_literal: true

require "test_helper"

class Public::RoadsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_roads_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_roads_edit_url
    assert_response :success
  end

  test "should get new" do
    get public_roads_new_url
    assert_response :success
  end

  test "should get index" do
    get public_roads_index_url
    assert_response :success
  end
end
