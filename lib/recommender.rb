class WorkRecommender

  # a new instance of recommender for each user
  # user is an instance of user
  def initialize(user)
    @user = user
  end

  def self.recommendations
    all_users = User.all

    user_indices = Hash.new
    all_users.each do |user|
      user_indices[user] = calculate_jaccard(@user, user)
    end

    user_indices = user_indices.sort_by { |user, index| index } # is this ascending or descending?
    top_similar = user_indices.first(5).keys # can change this to last(5) if ascending

    recommendations = Array.new
    top_similar.each do |user|
      user.works.each do |user_work|
        @user.work.each do |work|
          recommendations << user_work unless user_work == work
        end
      end
    end

    return recommendations
  end

  def calculate_jaccard(user, other)
    intersection =  user.works & other.works
    union = user.works | other.works

    inter_count = intersection.length.to_f
    union_count = union.length.to_f

    return (inter_count/union_count).round(1)
  end

  # parts needed:
  # @user list of works
  # all users and their list of works
  # iterate over all other users and calculate the jaccard index
  # sort those indices
  # take the top 5 or so and recommend the things that are not already upvoted

end
