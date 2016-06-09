class Usermeetup < ActiveRecord::Base
  belongs_to :meetups
  belongs_to :users

  validates :meetups, presence: true
  validates :users, presence: true
end



# db :create_migration NAME = Makeusernamesunique
#
# class Makeusernamesunique
#   def change
#     change_column :username, :email, :string, unique: true,
#   end
# end
