require 'csv'

my_file = CSV.open('./db/media_seeds.csv', headers: true)

my_file.each do |line|
  input_data = {}

  input_data[:category] = line[0]
  input_data[:title] = line[1]
  input_data[:creator] = line[2]
  input_data[:publication_year] = line[3]
  input_data[:description] = line[4]

  Work.create(input_data)
end
