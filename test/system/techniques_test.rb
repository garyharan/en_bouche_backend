require "application_system_test_case"

class TechniquesTest < ApplicationSystemTestCase
  setup do
    @technique = techniques(:one)
  end

  test "visiting the index" do
    visit techniques_url
    assert_selector "h1", text: "Techniques"
  end

  test "should create technique" do
    visit techniques_url
    click_on "New technique"

    fill_in "Description", with: @technique.description
    fill_in "Name", with: @technique.name
    click_on "Create Technique"

    assert_text "Technique was successfully created"
    click_on "Back"
  end

  test "should update Technique" do
    visit technique_url(@technique)
    click_on "Edit this technique", match: :first

    fill_in "Description", with: @technique.description
    fill_in "Name", with: @technique.name
    click_on "Update Technique"

    assert_text "Technique was successfully updated"
    click_on "Back"
  end

  test "should destroy Technique" do
    visit technique_url(@technique)
    click_on "Destroy this technique", match: :first

    assert_text "Technique was successfully destroyed"
  end
end
