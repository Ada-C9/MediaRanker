class CreateWorksUsersJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :users_works do |t|
    t.belongs_to :book, index: true
    t.belongs_to :genre, index: true

    t.timestamps
    end
  end
end
