class UserMeetups < ActiveRecord::Migration
  def change
    create_table :usermeetups do |t|
      t.belongs_to :user, null: false
      t.belongs_to :meetup, null: false
    end
  end
end
