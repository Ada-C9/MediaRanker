# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

MEDIA_FILE = Rails.root.join('db', 'media_seeds.csv')
puts "Loading raw driver data from #{MEDIA_FILE}"

work_failures = []
CSV.foreach(MEDIA_FILE, :headers => true) do |row|
  work = Work.new
  work.category = row['category']
  work.title = row['title']
  work.creator = row['creator']
  work.publication_year = row['publication_year']
  work.description = row['description']
  successful = work.save
  if !successful
    work_failures << work
    puts "Failed to save work: #{work.inspect}"
  else
    puts "Created work: #{work.inspect}"
  end
end

puts "Added #{Work.count} work records"
puts "#{work_failures.length} works failed to save"


USER_FILE = Rails.root.join('db', 'user_seeds.csv')
puts "Loading raw driver data from #{USER_FILE}"

user_failures = []
CSV.foreach(USER_FILE, :headers => true) do |row|
  user = User.new
  user.username = row['username']
  user.join_date = row['join_date']
  successful = user.save
  if !successful
    user_failures << user
    puts "Failed to save user: #{user.inspect}"
  else
    puts "Created user: #{user.inspect}"
  end
end

puts "Added #{User.count} user records"
puts "#{user_failures.length} users failed to save"


UPVOTE_FILE = Rails.root.join('db', 'upvote_seeds.csv')
puts "Loading raw driver data from #{UPVOTE_FILE}"

upvote_failures = []
CSV.foreach(UPVOTE_FILE, :headers => true) do |row|
  upvote = Upvote.new
  upvote.vote_date = row['vote_date']
  upvote.user_id = row['user_id']
  upvote.work_id = row['work_id']
  successful = upvote.save
  if !successful
    upvote_failures << upvote
    puts "Failed to save upvote: #{upvote.inspect}"
  else
    puts "Created upvote: #{upvote.inspect}"
  end
end

puts "Added #{Upvote.count} upvote records"
puts "#{upvote_failures.length} upvotes failed to save"
