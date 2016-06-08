class User < ActiveRecord::Base
  has_many :usermeetups
  has_many :meetups, through: :usermeetups

  validates :email, uniqueness: true

  def self.find_or_create_from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

    find_or_create_by(provider: provider, uid: uid) do |user|
      user.provider = provider
      user.uid = uid
      user.email = auth.info.email
      user.username = auth.info.name
      user.avatar_url = auth.info.image
    end
  end
end


# meetup1 = Meetup.create(name: "user", description: "asfgasf", location: "la", creator: User.find(4))
