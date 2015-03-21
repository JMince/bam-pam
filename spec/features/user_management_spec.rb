require "rails_helper"

feature "app users" do
  scenario "can signup with valid credentials" do
    visit root_path

    click_on "Sign Up"
    fill_in "Name", with: "pamela"
    fill_in "Password", with: "password"

    within("form") do
      click_on "Sign Up"
    end
    expect(page).to have_content "Welcome, Pamela"
    expect(page).to have_link "Sign Out"
  end

  scenario "can sign out" do
    user = create_user
    sign_in(user)
    click_on "Sign Out"
    expect(page).to have_content "Signed Out"
  end
end
