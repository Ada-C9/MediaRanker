class AddReference < ActiveRecord::Migration[5.1]
  def change
    add_reference :votes, :user, forgin_key: true
    add_reference :votes, :work, forgin_key: true
  end
end
