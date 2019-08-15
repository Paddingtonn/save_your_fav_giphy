require "application_system_test_case"

class GiphiesTest < ApplicationSystemTestCase
  setup do
    @giphy = giphies(:one)
  end

  test "visiting the index" do
    visit giphies_url
    assert_selector "h1", text: "Giphies"
  end

  test "creating a Giphy" do
    visit giphies_url
    click_on "New Giphy"

    fill_in "Image", with: @giphy.image
    fill_in "Title", with: @giphy.title
    click_on "Create Giphy"

    assert_text "Giphy was successfully created"
    click_on "Back"
  end

  test "updating a Giphy" do
    visit giphies_url
    click_on "Edit", match: :first

    fill_in "Image", with: @giphy.image
    fill_in "Title", with: @giphy.title
    click_on "Update Giphy"

    assert_text "Giphy was successfully updated"
    click_on "Back"
  end

  test "destroying a Giphy" do
    visit giphies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Giphy was successfully destroyed"
  end
end
