module TransposingHelper

  def transpose_btn_group(tab, semitones: 0, notation: :latin)
    capture do
      concat transpose_link(tab, semitones, -2, notation)
      concat transpose_link(tab, semitones, -1, notation)
      concat transpose_link(tab, semitones,  1, notation)
      concat transpose_link(tab, semitones,  2, notation)
      concat undo_transport(tab, semitones, notation) unless semitones.zero?
    end
  end

  def transpose_link(tab, semitones, transport, notation)
    path = tab_path(tab, semitones: semitones + transport, notation: notation)
    link_to tones(transport), path, remote: true, class: 'tooltiped btn btn-default', title: t(transport, scope: :transposing)
  end

  def undo_transport(tab, semitones, notation)
    link_to tab_path(tab, semitones: 0, notation: notation), remote: true, class: 'btn btn-primary refresh' do
      concat content_tag :span, tones(semitones), class: 'text'
      concat icon 'undo'
    end
  end

  private

  def tab_path(tab, semitones:, notation:)
    options = {}
    options[:semitones] = semitones unless semitones.zero?
    options[:notation]  = :american if notation == :american
    artist_tab_path(tab.artist, tab, options)
  end

  def tones(semitones)
    return '0' if semitones.zero?
    str = semitones > 0 ? '+' : '-'
    str << (semitones.abs / 2).to_s if semitones.abs > 1
    str << '½' if semitones.odd?
    str
  end

end