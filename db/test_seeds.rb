require 'faker'
# users
unsaved_users =[]
20.times do
  user = User.new
  user.username = Faker::ParksAndRec.character.gsub(' ', '').concat(rand(1-20).to_s)
  successful = user.save
  if !successful
    unsaved_users << user
  end
end

20.times do
  user = User.new
  user.username = Faker::HarryPotter.character.gsub(' ', '').concat(Faker::HarryPotter.house)
  successful = user.save
  if !successful
    unsaved_users << user
  end
end

category = Category.new(name: 'pokemon')
# works
unsaved_works = []
20.times do
  work = Work.new
  work.title = Faker::Pokemon.name
  work.category = category
  work.creator = Faker::Pokemon.location
  work.description = Faker::Pokemon.move
  successful = work.save
  if !successful
    unsaved_works << work
  end
end

# 20.times do |i|
#   user = User.find(i + 1)
#   work = Work.find(rand(1-20))
#
#   vote = Vote.new
#   vote.user_id = user.id
#   vote.work_id = work.id
  successful = vote.save

  if !successful
    puts "vote not saved"
    until vote.errors.messages[:user].nil?
      user = User.find(i + 2)

      vote = Vote.new
      vote.user_id = user.id
      vote.work_id = work.id
    end
  end
#
#   i += 1
# end


puts "#{unsaved_users.length} not saved"
puts "#{unsaved_works.length} works not saved"
