class Usermeetup < ActiveRecord::Base
  belongs_to :meetups
  belongs_to :users
end



# db :create_migration NAME = Makeusernamesunique
#
# class Makeusernamesunique
#   def change
#     change_column :username, :email, :string, unique: true,
#   end
# end
