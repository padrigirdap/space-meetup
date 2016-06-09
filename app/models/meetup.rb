class Meetup < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  has_many :usermeetups
  has_many :users, through: :usermeetups

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :creator_id, presence: true
end
