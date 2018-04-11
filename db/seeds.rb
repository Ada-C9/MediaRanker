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

USER_FILE = Rails.root.join('db', 'user_seeds.csv')
puts "Loading raw user data from #{USER_FILE}"

user_failures = []
CSV.foreach(USER_FILE, :headers => true) do |row|
  user = User.new
  user.name = row['name']
  user.joined = DateTime.parse(row['joined'])

  successful = user.save
  if !successful
    user_failures << user
    puts "Failed to save user: #{user.inspect}"
  else
    puts "Created user: #{user.inspect}"
  end
end
