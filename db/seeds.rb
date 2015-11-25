100.times do |n|
  name  = Faker::Name.name
  email = "hiennv-#{n+1}@gmail.com"
  password = "123456"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Commerce.department
  body = Faker::Lorem.sentence(5)
  users.each { |user| user.entries.create!(title: title,body: body) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
