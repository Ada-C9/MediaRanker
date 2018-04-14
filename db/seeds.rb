require 'csv'

ART_FILE = Rails.root.join('db', 'media_seeds.csv')
puts "Loading raw media data from #{ART_FILE}"

art_failures = []
CSV.foreach(ART_FILE, :headers => true) do |row|
  art = Art.new
  art.category = row['category']
  art.title = row['title']
  art.creator = row['creator']
  art.pub_year = row['publication_year']
  art.description = row['description']
  successful = art.save
  if !successful
    art_failures << art
    puts "Failed to save art: #{art.inspect}"
  else
    puts "Created art: #{art.inspect}"
  end
end

puts "Added #{Art.count} art records"
puts "#{art_failures.length} arts failed to save"
