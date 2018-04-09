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

INSTAGRAM_FILE= Rails.root.join('db', 'seed_data', 'instagram.csv')
puts "Loading raw instagram data from #{INSTAGRAM_FILE}"

instagram_failures = []
CSV.foreach(INSTAGRAM_FILE, :headers => true) do |row|
  driver = Driver.new
  driver.id = row['id']
  driver.name = row['name']
  driver.vin = row['vin']
  successful = driver.save
  if !successful
    driver_failures << driver
    puts "Failed to save driver: #{driver.inspect}"
  else
    puts "Created driver: #{driver.inspect}"
  end
end

puts "Added #{Driver.count} driver records"
puts "#{driver_failures.length} drivers failed to save"
