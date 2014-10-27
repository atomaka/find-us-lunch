class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_uniqueness_of :friend_id, :scope => :user_id
  validate :disallow_self_reference

  def disallow_self_reference
    if friend_id == user_id
      errors.add(:friend_id, 'cannot refer back to self')
    end
  end
end
