def create_user(options = {})
  defaults = {name: "pamela1", password: "password"}
  User.create!(defaults.merge(options))
end
