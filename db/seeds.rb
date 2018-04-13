require 'csv'

PUBLICATION_FILE = Rails.root.join('db', 'media_seeds.csv')
puts "Loading raw publication data from #{PUBLICATION_FILE}"

publication_failures = []
CSV.foreach(PUBLICATION_FILE, :headers => true) do |row|
  publication = Publication.new
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
puts "#{publication_failures.length} publication failed to save"

puts "done"
