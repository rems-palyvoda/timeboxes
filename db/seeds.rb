DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

user = User.create email: "admin@example.com", password: "password", password_confirmation: "password"

5.times do |i|
  user.projects.create title: "Project number #{i}"
end
