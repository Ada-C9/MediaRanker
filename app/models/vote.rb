class Vote < ApplicationRecord
	belongs_to :user, :counter_cache => true
	# belongs_to :work, dependent: :destroy, :counter_cache => true
	belongs_to :work, :counter_cache => true


	validates :user, :work, presence: true
	validates :user, :uniqueness => { :scope => :work, :case_sensitive => false,
		:message => "Already voted for this work"}

	# def get_work_info
	# 	return work.attributes
	# end

end
