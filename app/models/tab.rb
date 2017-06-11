class Tab < ActiveRecord::Base
  extend FriendlyId
  friendly_id :create_slug, use: :slugged

  scope :active , -> {where(active: true)}
  scope :popular, -> {active.order(visits_count: :desc)}

  belongs_to :artist, counter_cache: true
  belongs_to :user
  has_many   :favorites
  has_many   :visits
  has_many   :votes

  validates  :artist, :title, :content, presence: true
  validates  :old_slug, uniqueness: true, allow_nil: true

  def stars
    (ranking.blank? ||ranking.zero?) ? 6 : ranking.round
  end

  private

  def create_slug
    [:title, [:title, artist.name], [:title, artist.name, Tab.where(title:title).count]]
  end
end