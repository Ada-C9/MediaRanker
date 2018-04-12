class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :votes

  validates :username, presence: true, uniqueness: true

  def self.recommendations(new_user)
    all_users = User.where.not(id: nil)

    user_indices = Hash.new
    all_users.each do |user|
      user_indices[user] = User.calculate_jaccard(new_user, user)
    end

    # p user_indces
    user_indices = user_indices.sort_by { |user, index| index } # is this ascending or descending?
    top_similar_raw = user_indices.last(2) # can change this to last(5) if ascending - format [user, jaccard]
    # p top_similar_raw

    top_similar = Array.new
    top_similar_raw.each do |user_index|
      top_similar << user_index[0]
    end
    # p top_similar

    recommendations = User.get_recommendations(top_similar, new_user) # this should probably not be a class method but it is for now for testing

    return recommendations.uniq
  end

  def self.get_recommendations(top_similar, new_user)
    recommendations = Array.new
    top_similar.each do |user|
      user.works.each do |work|
        new_user.works.each do |new_user_work|
          recommendations << work unless work == new_user_work
        end
      end
    end
    return recommendations
  end

  def self.calculate_jaccard(user, other)
    intersection =  user.works & other.works
    union = user.works | other.works

    inter_count = intersection.length.to_f
    union_count = union.length.to_f

    return (inter_count/union_count).round(1)
  end
end
