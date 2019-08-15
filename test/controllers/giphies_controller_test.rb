require 'test_helper'

class GiphiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @giphy = giphies(:one)
  end

  test "should get index" do
    get giphies_url
    assert_response :success
  end

  test "should get new" do
    get new_giphy_url
    assert_response :success
  end

  test "should create giphy" do
    assert_difference('Giphy.count') do
      post giphies_url, params: { giphy: { image: @giphy.image, title: @giphy.title } }
    end

    assert_redirected_to giphy_url(Giphy.last)
  end

  test "should show giphy" do
    get giphy_url(@giphy)
    assert_response :success
  end

  test "should get edit" do
    get edit_giphy_url(@giphy)
    assert_response :success
  end

  test "should update giphy" do
    patch giphy_url(@giphy), params: { giphy: { image: @giphy.image, title: @giphy.title } }
    assert_redirected_to giphy_url(@giphy)
  end

  test "should destroy giphy" do
    assert_difference('Giphy.count', -1) do
      delete giphy_url(@giphy)
    end

    assert_redirected_to giphies_url
  end
end
