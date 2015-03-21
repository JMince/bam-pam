require "rails_helper"

feature "user memberships" do
  scenario "can be created by selecting a club" do
    Club.create!(name: "Boardgames")
    Club.create!(name: "Chinese Conversation")
    user = create_user(name: "star_student", password: "password")

    sign_in(user)

    visit root_path

    expect(page).to have_content "You belong to: 0 clubs"

    click_on "New Membership"
    expect(current_path).to eq new_user_membership_path(user)

    select("Chinese Conversation", from: "Clubs")

    click_on "Join Club"
    expect(current_path).to eq user_memberships_path

    expect(page).to have_content "You've joined the Chinese Conversation club!"
    expect(page).to have_content "You belong to: 1 club"

    click_on "New Membership"

    select("Boardgames", from: "Clubs")

    click_on "Join Club"
    expect(current_path).to eq user_memberships_path

    expect(page).to have_content "You've joined the Boardgames club!"
    expect(page).to have_content "You belong to: 2 clubs"
  end
end
