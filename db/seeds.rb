100.times do |post|
    Post.create(date: Date.today,rationale: "#{post} rationale content")
end

puts "100 rationale content is done."