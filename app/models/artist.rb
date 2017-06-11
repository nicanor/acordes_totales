class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :tabs
  has_many :visits

  validates :name, presence: true

  scope :active, -> {where(active: true).order(visits_count: :desc)}

  dragonfly_accessor 'photo' do
    storage_options do |f|
      { path: File.join('artist', id.to_s, "photo-#{rand(10000)}.#{f.format}") }
    end
  end

  def destroyable?
    tabs.empty?
  end

  def destroy
    super if destroyable?
  end
end
