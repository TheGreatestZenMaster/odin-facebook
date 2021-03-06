# Users
User.create!(first_name:  "Jake",
             last_name:     "Example",
             email: "jake@example.com",
             password:              "password",
             password_confirmation: "password",
             confirmed_at: DateTime.now)
             
9.times do |n|
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(first_name:  Faker::Name.first_name,
               last_name:   Faker::Name.last_name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# Friendships
user = User.first
5.times do |x|
    user2 = User.find(x + 2)
    friendship = user2.friendships.create!(friend_id: user.id, accepted: true)
end
3.times do |x|
    user2 = User.find(x + 7)
    friendship = user2.friendships.create!(friend_id: user.id)
    friendship.create_notification!(notify_id: user.id, notify_from_id: user2.id)
end

# Posts
users = User.order(:created_at).take(6)
50.times do
    content = Faker::Lorem.sentence(15)
    users.each { |user| user.posts.create!(content: content) }
end