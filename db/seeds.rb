
require 'csv'

WORKS_FILE = Rails.root.join('db', 'csv_seeders', 'media_seeds.csv')

puts "Loading raw driver data from #{WORKS_FILE}"

work_failures = []
CSV.foreach(WORKS_FILE, :headers => true) do |row|
  work = Work.new
  work.category = row['category']
  work.title = row['title']
  work.creator = row['creator']
  work.year_released = row['publication_year']
  work.description = row['description']
  successful = work.save
  if !successful
    work_failures << work
    puts "Failed to save work: #{work.inspect}"
  else
    puts "Created work: #{work.inspect}"
  end
end

puts "Added #{Work.count} records of media works."
puts "#{work_failures.length} works failed to save."




USERS_FILE = Rails.root.join('db', 'csv_seeders', 'user_seeds.csv')

puts "Loading raw user data from #{USERS_FILE}"

user_failures = []
CSV.foreach(USERS_FILE, :headers => true) do |row|
  user = User.new
  user.name = row['name']
  successful = user.save
  if !successful
    user_failures << user
    puts "Failed to save user: #{user.inspect}"
  else
    puts "Created user: #{user.inspect}"
  end
end

puts "Added #{User.count} records of users."
puts "#{user_failures.length} users failed to save."



VOTES_FILE = Rails.root.join('db', 'csv_seeders', 'vote_seeds.csv')

puts "Loading raw vote data from #{VOTES_FILE}"

vote_failures = []
CSV.foreach(VOTES_FILE, :headers => true) do |row|
  vote = Vote.new
  vote.work_id = row['work_id']
  vote.user_id = row['user_id']
  successful = vote.save
  if !successful
    vote_failures << vote
    puts "Failed to save vote: #{vote.inspect}"
  else
    puts "Created vote: #{vote.inspect}"
  end
end

puts "Added #{Vote.count} records of votes."
puts "#{vote_failures.length} votes failed to save."
