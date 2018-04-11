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
  work.created_by = row['creator']
  work.published_year = row['publication_year']
  work.description = row['description']

  successful = work.save
  if !successful
    work_failures << work
    puts "Failed to save work: #{work.inspect}"
  else
    puts "Created work: #{work.inspect}"
  end
end
