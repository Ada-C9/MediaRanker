class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :instagram, optional: true
  belongs_to :twitter, optional: true
  belongs_to :subreddit, optional: true


  # validates :user, :uniqueness => { :scope => :instagram, :case_sensitive => false,
  # :message => "Already voted for this work"}
  # validates :user, :uniqueness => { :scope => :twitter, :case_sensitive => false,
  # :message => "Already voted for this work"}
  # validates :user, :uniqueness => { :scope => :subreddit, :case_sensitive => false,
  #   :message => "Already voted for this work"}
# validates_uniqueness_of :user_id, scope: :instagram_id, :allow_nil => true
# validates_uniqueness_of :user_id, scope: :twitter_id, :allow_nil => true
# validates_uniqueness_of :user_id, scope: :subreddit_id, :allow_nil => true

  validates :instagram, :uniqueness => { :scope => [:user_id] }
  validates :twitter, :uniqueness => { :scope => [:user_id] }
  validates :subreddit, :uniqueness => { :scope => [:user_id] }


end
