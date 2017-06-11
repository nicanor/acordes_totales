class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :content, presence: true

  scope :published,  -> {ordered.where.not(publication_date: nil)}
  scope :ordered, -> {order(:publication_date)}

  def destroy
    super unless protected?
  end

end