# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

FILE = Rails.root.join('db', 'media_seeds.csv')

categories =  {album: Category.find_by(name: 'album'), book: Category.find_by(name: 'book')}

unsaved = []
CSV.read(FILE, headers: true).each do |row|
  work = Work.new
  if row['category'] == 'album'
    work.category = categories[:album]
  elsif row['category'] == 'book'
    work.category = categories[:book]
  end
  work.title = row['title']
  work.creator = row['creator']
  work.publication_year = row['publication_year'].to_i
  work.description = row['description']

  successful = work.save
  if !successful
    unsaved << work
  end

end
puts "#{unsaved.length} works not saved"
