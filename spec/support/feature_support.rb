def sign_in(user = create_user)
  visit sign_in_path

  fill_in "Name", with: user.name
  fill_in "Password", with: user.password

  within("form") { click_on "Sign In"}
end
