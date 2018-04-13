module VotesHelper
  def vote_creation_date(vote)
    raw_date = vote.first.created_at
    stripped_date = raw_date.strftime("%B %d, %Y")
    return stripped_date
  end
end
