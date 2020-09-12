  
@user = User.create(email: "test@test.com", password: "testing1234", password_confirmation: "testing1234", first_name: "Jon", last_name: "Snow")

AdminUser.create(email: "admin@test.com", password: "testing1234", password_confirmation: "testing1234", first_name: "Admin", last_name: "Istrator")

puts "1 User created"

100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"