module TabsHelper

  def change_notation_link(tab, semitones: semitones, notation: :latin)
    new_notation = (notation == :american ? :latin : :american)
    path  = tab_path(tab, semitones: semitones, notation: new_notation)
    label = I18n.t(notation, scope: :notation_label).html_safe
    link_to label, path, remote: true, class: 'tooltiped btn btn-default', title: t(new_notation, scope: :change_to)
  end

  def favorite_link(tab, is_favorite)
    link_to favorite_icon(is_favorite), favorite_path(tab), method: :post, remote: true
  end

  def transcriptor_link(user)
    link_to "#{I18n.t :transcriptor} #{user.first_name} #{user.last_name}", user_path(user), class: :transcriptor if user
  end

  private

  def favorite_icon(is_favorite)
    name  = is_favorite ? 'fa-bookmark'     : 'fa-bookmark-o'
    title = is_favorite ? 'favorite_remove' : 'favorite_add'
    content_tag :span, nil, class: [:fa, 'fa-3x', name, 'text-warning' ], title: t(title)
  end
end