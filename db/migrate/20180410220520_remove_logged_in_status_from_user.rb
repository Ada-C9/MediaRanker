class RemoveLoggedInStatusFromUser < ActiveRecord::Migration[5.1]
  def change
      remove_column :users, :logged_in
  end
end
