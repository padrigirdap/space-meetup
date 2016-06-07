class UserMeetups < ActiveRecord::Migration
  def change
    create_table :usermeetups do |t|
      t.belongs_to :users, null: false
      t.belongs_to :meetups, null: false
    end
  end
end
