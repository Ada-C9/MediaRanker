module WorksHelper
  def self.get_vote_date(work, user)
      work.votes.each do |vote|
        if vote.user_id == user.id
          return vote.created_at.strftime('%b %-d, %Y')
        end
      end
  end
end
