# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'faker'

["album", "book", "movie"].each do |category|
  Category.create( name: category )
end

puts "Created #{Category.count} category records"


WORKS_FILE = Rails.root.join('db','seed_data', 'media_seeds.csv')

work_failures = []

CSV.foreach(WORKS_FILE, :headers => true) do |row|
  work = Work.new
  work.category = Category.find_by(name: row['category'])
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




User.create!(username: 'admin')

25.times do |i|
  User.create!(username: "#{Faker::Name.first_name.gsub(" ", "")}#{rand(0..300)}")
end

puts "Created #{User.count} user records"


User.all.each do |u|
  18.times do |i|
    v = Vote.new(user: u, work: Work.all.sample)
    if v.valid?
      v.save
    else
      next
    end
  end
end

puts "Created #{Vote.count} vote records"
