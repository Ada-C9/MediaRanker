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
