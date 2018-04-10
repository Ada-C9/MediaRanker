# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# instagrams = Instagram.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }]) name posts followers
#
# twitter handle followers
# subreddit name summary subscribers
require 'csv'

INSTAGRAM_FILE= Rails.root.join('db', 'seed_data', 'instagrams.csv')
puts "Loading raw instagram data from #{INSTAGRAM_FILE}"

instagram_failures = []
CSV.foreach(INSTAGRAM_FILE, :headers => true) do |row|
  instagram = Instagram.new
  instagram.id = row['id']
  instagram.handle = row['handle']
  instagram.posts = row['posts']
  instagram.followers = row['followers']
  successful = instagram.save
  if !successful
    instagram_failures << instagram
    puts "Failed to save instagram: #{instagram.inspect}"
  else
    puts "Created instagram: #{instagram.inspect}"
  end
end

puts "Added #{Instagram.count} instagram records"
puts "#{instagram_failures.length} instagrams failed to save"

  SUBREDDIT_FILE = Rails.root.join('db', 'seed_data', 'subreddits.csv')
puts "Loading raw subreddit data from #{ SUBREDDIT_FILE }"

  subreddit _failures = []
CSV.foreach(SUBREDDIT_FILE , :headers => true) do |row|
    subreddit = Subreddit.new
    subreddit.id = row['id']
    subreddit.title = row['title']
    subreddit.description = row['description']
  successful = subreddit.save
  if !successful
      subreddit_failures << subreddit
    puts "Failed to save subreddit: #{subreddit.inspect}"
  else
    puts "Created subreddit: #{subreddit.inspect}"
  end
end

puts "Added #{Subreddit.count} subreddit records"
puts "#{subreddit_failures.length} subreddits failed to save"

TWITTER_FILE = Rails.root.join('db', 'seed_data', 'twitters.csv')
puts "Loading raw twitter data from #{TWITTER_FILE}"

twitter_failures = []
CSV.foreach(TWITTER_FILE , :headers => true) do |row|
  twitter = twitter.new
  twitter.id = row['id']
  twitter.handle = row['handle']
  twitter.followers = row['followers']
  successful = twitter.save
  if !successful
    twitter_failures << twitter
    puts "Failed to save twitter: #{twitter.inspect}"
  else
    puts "Created twitter: #{twitter.inspect}"
  end
end

puts "Added #{twitter.count} twitter records"
puts "#{twitter_failures.length} twitters failed to save"
