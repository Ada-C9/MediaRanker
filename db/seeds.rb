# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

PUBLICATION_FILE = Rails.root.join('db', 'publications_seeds.csv')
puts "Loading raw publication data from #{PUBLICATION_FILE}"

publication_failures = []
CSV.foreach(PUBLICATION_FILE, :headers => true) do |row|
  publication = Publication.new
  publication.id = row['id']
  publication.category = row['category']
  publication.title = row['title']
  publication.creator = row['creator']
  publication.publication_year = row['publication_year']
  publication.description = row['description']

  successful = publication.save
  if !successful
    publication_failures << publication
    puts "Failed to save publication: #{publication.inspect}"
  else
    puts "Created publication: #{publication.inspect}"
  end
end

puts "Added #{Publication.count} publication records"
puts "#{publication_failures.length} publications failed to save"


# Since we set the primary key (the ID) manually on each of the
# tables, we've got to tell postgres to reload the latest ID
# values. Otherwise when we create a new record it will try
# to start at ID 1, which will be a conflict.
puts "Manually resetting PK sequence on each table"
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "done"
