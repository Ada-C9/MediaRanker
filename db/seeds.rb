# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"
WORKS_FILE = Rails.root.join("db", "media_seeds.csv")
puts "Loading raw work data from #{WORKS_FILE}"

work_failures = []
CSV.foreach(WORKS_FILE, :headers => true) do |row|
  work = Work.new
  work.category = row["category"]
  work.title = row["title"]
  work.creator = row["creator"]
  work.publication_year = row["publication_year"]
  work.description = row["description"]
  successful = work.save
  if !successful
    work_failures << work
    puts "Failed to save work: #{work.inspect}"
  else
    puts "created work: #{work.inspect}"
  end
end

puts "Added #{Work.count} work records"
puts "#{work_failures.length} work failed to save"

puts "done"

raw_movies = [
  {
    category: "movie",
    title: "Coco",
    creator: "Pixar Animation Studios",
    publication_year: 2017,
    description: "The story follows a 12-year-old boy named Miguel Rivera who is accidentally transported to the land of the dead, where he seeks the help of his deceased musician great-great-grandfather to return him to his family among the living.",
  },
  {
    category: "movie",
    title: "Ferdinand",
    creator: "Blue Sky Studios",
    publication_year: 2017,
    description: "In Spain, a ranch owned by Moreno (Raúl Esparza) that trains bulls for bullfighting called Casa del Toro harbours a bull calf named Ferdinand.",
  },
  {
    category: "movie",
    title: "Paddington 2",
    creator: "Heyday Films and StudioCanal",
    publication_year: 2017,
    description: "Paddington, having settled with the Brown family in Windsor Gardens, has become popular in his community, offering people emotional support in various ways.",
  },
  {
    category: "movie",
    title: "The LEGO Batman Movie",
    creator: "Warner Animation Group",
    publication_year: 2017,
    description: "Within the Lego Universe, Batman continues to protect Gotham City and fight crime. During his latest mission to stop Joker from destroying the city, he hurts his arch-rival's feelings by telling him he is not as important in his life as he thinks he is, leading Joker to seek the ultimate revenge on him."
  },
  {
    category: "movie",
    title: "Woody Woodpecker",
    creator: "Mike Elliott",
    publication_year: 2017,
    description: "In the Pine Grove forest in Washington state, Woody Woodpecker toys with two taxidermist poachers, brothers Nate and Ottis Grimes, and eventually cause them to tranquilize each other."
  },
  {
    category: "movie",
    title: "The Star",
    creator: "Columbia Pictures",
    publication_year: 2017,
    description: "In 9 months B.C., Mary is visited by an angel telling her she will bear the Messiah. A pygmy jerboa named Abby overhears and tells the other animals as a star begins glowing brightly in the night."
  },
  {
    category: "movie",
    title: "My Little Pony: The Movie",
    creator: "Brian Goldner",
    publication_year: 2017,
    description: "After a dark force conquers Canterlot, the Mane 6 embark on an unforgettable journey beyond Equestria where they meet new friends and exciting challenges on a quest to use the magic of friendship to save their homeland.."
  },
  {
    category: "movie",
    title: "The Son of Bigfoot",
    creator: "Gina Gallo",
    publication_year: 2017,
    description: "A teenage boy journeys to find his missing father only to discover that he's actually Bigfoot."
  },
]

movie_failures = []

raw_movies.each do |movie|
  work = Work.new
  work.category = movie[:category]
  work.title = movie[:title]
  work.creator = movie[:creator]
  work.publication_year = movie[:publication_year]
  work.description = movie[:description]
  successful = work.save
  if !successful
    movie_failures << work
    puts "Failed to save work: #{work.inspect}"
  else
    puts "created work: #{work.inspect}"
  end
end
