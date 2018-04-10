require 'csv'

MEDIA_FILE = Rails.root.join('db', 'media_seeds.csv')
puts "Loading raw media data from #{MEDIA_FILE}"

media_failures = []
CSV.foreach(MEDIA_FILE, :headers => true) do |row|
  work = Work.new
  work.category = row['category']
  work.title = row['title']
  work.creator = row['creator']
  work.published = row['publication_year'].to_i
  work.description = row['description']
  successful = work.save
  if !successful
    media_failures << work
    puts "Failed to save work: #{work.inspect}"
  else
    puts "Created work: #{work.inspect}"
  end
end
