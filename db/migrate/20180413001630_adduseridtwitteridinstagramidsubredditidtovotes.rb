class Adduseridtwitteridinstagramidsubredditidtovotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :votes, :twitter_id
    remove_column :votes, :insta_id
    remove_column :votes, :subreddit_id
    remove_column :votes, :user_id 

    add_reference :votes, :twitter, foreign_key: true
    add_reference :votes, :instagram, foreign_key: true
    add_reference :votes, :subreddit, foreign_key: true
    add_reference :votes, :user, foreign_key: true
  end

end
