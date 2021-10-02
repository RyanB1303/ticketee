require "rails_helper"

RSpec.feature "User can sign up" do
  scenario "when providing valid details" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password12345"
    fill_in "Password confirmation", with: "password12345"
    click_button "Sign up"
    expect(page).to have_content("You have signed up successfully.")
  end
end