class Membership < ActiveRecord::Base

  validates :user, presence: true
  validates :role, presence: true

  validates :user, uniqueness: {scope: :project}

  belongs_to :project
  belongs_to :user

end
