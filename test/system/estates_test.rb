require "application_system_test_case"

class EstatesTest < ApplicationSystemTestCase
  setup do
    @estate = estates(:one)
  end

  test "visiting the index" do
    visit estates_url
    assert_selector "h1", text: "Estates"
  end

  test "should create estate" do
    visit estates_url
    click_on "New estate"

    click_on "Create Estate"

    assert_text "Estate was successfully created"
    click_on "Back"
  end

  test "should update Estate" do
    visit estate_url(@estate)
    click_on "Edit this estate", match: :first

    click_on "Update Estate"

    assert_text "Estate was successfully updated"
    click_on "Back"
  end

  test "should destroy Estate" do
    visit estate_url(@estate)
    click_on "Destroy this estate", match: :first

    assert_text "Estate was successfully destroyed"
  end
end
