User.create!(name: "Gin", email: "darkdragon236@gmail.com",
  password: "1234567", password_confirmation: "1234567", role: "admin")

User.create!(name: "A", email: "tuanh@gmail.com",
  password: "1234567", password_confirmation: "1234567")

29.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, email: email,
    password: password, password_confirmation: password)
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}

["Basic 500", "At the restaurant", "Game"].each do |name|
  Caterory.create!(name: name)
end

Caterory.all.each do |caterory|
  50.times do |n|
    caterory.words.create!(learning_word: "GG#{n}", meaning: "BoBo#{n}")
  end
end
