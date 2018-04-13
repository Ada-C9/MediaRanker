# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('db', 'media_seeds.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

work_failures = []

csv.each do |row|
  work = Work.new
  work.category = row['category']
  work.title =row['title']
  work.creator = row['creator']
  work.publication_year = row['publication_year']
  work.description = row['description']
  successful = work.save

  if !successful
    work_failures << work
    puts "Failed to save work: #{work.inspect}"
  else
    puts "Created work:
    #{work.inspect}"
  end
end

puts "Added #{Work.count} work records"
puts "#{work_failures.length} works failed to save"

50.times do |index|
  Work.create!(category: "movie",
    title: Faker::HeyArnold.character,
    creator: Faker::Name.name,
    publication_year:
    Faker::Number.between(1995, 2018),
    description:
    Faker::HeyArnold.quote)
  end

  p "Created #{Work.count - 29} Hey Arnold movies"

  25.times do |index|
    Work.create!(category: "book",
      title: Faker::RuPaul.queen,
      creator: Faker::Name.name,
      publication_year:
      Faker::Number.between(1995, 2018),
      description:
      Faker::RuPaul.quote)
    end

    p "Created #{Work.count - 29} RuPaul books"


puts "done"
