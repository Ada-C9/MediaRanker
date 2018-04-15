# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = Rails.root.join('db', 'media_seeds.csv')


import_failures = []
i = 1
CSV.foreach(csv_text, :headers => true) do |row|
  work = Work.new
  work.id = i
  work.work_category = row['work_category']
  work.work_title = row['work_title']
  work.work_creator = row['work_creator']
  work.work_publication_year = row['work_publication_year']
  work.work_description = row['work_description']
  successful = work.save
  puts "Created work: #{work.inspect}"
  if !successful
    import_failures << work
  end
  i += 1
end

puts "There are now #{Work.count} rows in the transactions table"
puts "Unfortunately, #{import_failures.length} works failed to save"
