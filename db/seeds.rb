require 'csv'

def process_seed_data()
  works = CSV.open('./db/media_seeds.csv', headers: true)

  works.each do |work|
    puts "LOok here #{work[1]}"
    data = {}

    data[:category] = work[0]
    data[:title] = work[1]
    data[:created_by] = work[2]
    data[:publication_date] = work[3]
    data[:description] = work[4]

    w = Work.create(data)

  end
end


process_seed_data()
