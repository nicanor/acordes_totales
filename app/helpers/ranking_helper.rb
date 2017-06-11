module RankingHelper

  def stars(ranking)
    return 6 if ranking.zero?
    ranking.round
  end

  def vote_stars(tab)
    capture do
      concat vote_link(tab,  2, :awful)
      concat vote_link(tab,  4,   :bad)
      concat vote_link(tab,  6,    :ok)
      concat vote_link(tab,  8,  :good)
      concat vote_link(tab, 10, :great)
    end
  end

  private

  def vote_link(tab, value, title)
    link_to star, vote_path(tab, value), method: :post, title: I18n.t(title), remote: true
  end

  def star
    icon :star
  end

  def half
    icon 'star-half'
  end

end