module PublicationsHelper

  def find_top_ten_by(category)
    pub_by_category = Publication.all.order(created_at: :asc).where(category: category)
    sorted_pub_by_category = sort_by_votes(pub_by_category)
    if sorted_pub_by_category.length <= 10
      return sorted_pub_by_category
    else
      return sorted_pub_by_category.first(10)
    end
  end

  def sort_by_votes(publications)
    sort_by_vote = publications.sort_by do |publication|
      if publication.most_recent_vote.nil?
        0
      else
        publication.most_recent_vote.created_at.to_i
      end
    end
    sorted_by_votes_count = sort_by_vote.sort_by { |publication| publication.votes.length }
    sorted_by_votes_count.reverse!
  end

end
