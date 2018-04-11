class Work < ApplicationRecord
  # def display_albums
  #   return Book.where(category:'album')
  # end
  has_many :votes
  has_many :users, through: :votes

  validates :title, presence: true,  uniqueness: true

#   def search_user(user_id)
#     self.users.each do |a_user|
#       if a_user.id == user_id
#         return a_user.name
#       else
#         return nil
#       end
#   end
#   # validates :creator, presence: true
#   # validates :publication_year, presence: true
#   # validates :description, presence: true
# end
end
