@user = User.create(email:"hello@gmail.com",password:"password",first_name:"Jorden",last_name:"Hudgens",username:"Jorden")
100.times do |post|
    Post.create(date: Date.today,rationale: "#{post} rationale content",user: @user)
end

puts "100 rationale content is done."