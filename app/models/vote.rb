class Vote < ActiveRecord::Base
  belongs_to :tab, counter_cache: true
  belongs_to :user

  VALUES  = [2, 4, 6, 8, 10]
  IP_REGEX = /\A(?:25[0-5]|(?:2[0-4]|1\d|[1-9])?\d)(?:\.(?:25[0-5]|(?:2[0-4]|1\d|[1-9])?\d)){3}\z/

  validates :value, inclusion: {in: VALUES}
  validates :ip, format: {with: IP_REGEX}
  validates :tab_id, uniqueness: {scope: :ip}
  validates :tab_id, uniqueness: {scope: :user_id}

  after_save :update_tab_ranking

  private

  def update_tab_ranking
    tab.update(ranking: tab.votes.average(:value))
  end
end