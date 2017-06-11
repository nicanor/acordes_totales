class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :create_slug, use: :slugged

  authenticates_with_sorcery!

  has_many :visits
  has_many :tabs
  has_many :favorites
  has_many :authentications, dependent: :destroy

  accepts_nested_attributes_for :authentications

  ROLES = ['admin', 'registered_user']

  validates :password, confirmation: true, if: Proc.new { |user| user.password.present? }

  dragonfly_accessor 'photo' do
    storage_options do |f|
      { path: File.join('user', id.to_s, "photo-#{rand(10000)}.#{f.format}") }
    end
  end

  private

  def create_slug
    [[:first_name, :last_name]]
  end
end