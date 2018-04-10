require 'csv'

WORK_FILE = Rails.root.join('db', 'media_seeds.csv')

puts "Loading raw media data from #{WORK_FILE}"

work_failures = []
CSV.foreach(WORK_FILE, :headers => true) do |row|
  work = Work.new
  work.category = row['category']
  work.title = row['title']
  work.creator = row['creator']
  work.publication_year = row['publication_year']
  work.description = row['description']
  successful = work.save
  if !successful
    work_failures << work
    puts "Failed to save media: #{work.inspect}"
  else
    puts "Created media: #{work.inspect}"
  end
end

puts "Added #{Work.count} media records"
puts "#{work_failures.length} works failed to save"
