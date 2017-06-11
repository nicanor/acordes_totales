class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :tab
  belongs_to :artist

  validates :user, :tab, :artist, presence: true
  validates :tab_id, uniqueness: {scope: :user_id}
end
