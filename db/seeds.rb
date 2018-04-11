require 'csv'

csv_text = File.read(Rails.root.join('db', 'migrate', 'media_seeds.csv'))
puts csv_text


# category,title,creator,publication_year,description
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
