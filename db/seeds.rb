# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# input is markup, csv File
# output is a hash in an array where the key in header or first row

def load_media()
  all_works = []

  works = CSV.open('media_seeds.csv', headers: true)

  works.each do |work|
    work[:category] = work[0]
    work[:title] = work[1]
    work[:created_by] = work[2]
    work[:publication_date] = work[3]
    work[:description] = work[4]

    all_works << Work.new(work)
  end

  return all_works
end
