class TranscriptionTranslator

  def initialize(semitones, notation: :latin, response: :html)
    @translator = ChordTransposer::Translator.new(semitones, notation: notation, response: response)
  end

  def call(transcription)
    transcription.lines.map! do |line|
      @translator.call(line)
    end.join
  end

end