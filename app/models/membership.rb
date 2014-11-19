class Membership < ActiveRecord: :Base

validates :user



belongs_to :project
belongs_to :user
enum :role => [ :member, :owner]
