class AddVoteTrackingToVotes < ActiveRecord::Migration[5.1]
  def change
    add_column(:votes, :vote_tracking, :timestamp, )
  end
end
