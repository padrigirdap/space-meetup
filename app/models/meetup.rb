class Meetup < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  has_many :usermeetups
  has_many :users, through: :usermeetups
end
