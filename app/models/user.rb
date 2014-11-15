class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, through: :friendships

  scope :all_except, ->(user) { where.not(id: user) }

  def self.from_omniauth(auth)
    where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
      user.provider = auth[:provider]
      user.uid      = auth[:uid]
      user.name     = auth[:info][:name]
      user.email    = auth[:info][:email]
      user.save
    end
  end
end
