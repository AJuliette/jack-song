class Sing
  def initialize(lyrics:, random: false, echo: false)
    @lyrics = lyrics
    @random = random
    @echo = echo
  end

  def run
    lyrics = if @random
                @lyrics.shuffle
              else
                @lyrics
              end

    p song_writer(lyrics: lyrics)
  end

  def song_writer(lyrics: lyrics)
    lyrics.each.with_index.each_with_object([]) do |(lyric,i), array|
      array << verse_writer(index: i, lyrics: lyrics)
    end
  end

  def verse_writer(index:, lyrics:)
    verse = ((11 - index)..11).to_a.each_with_object([]) do |i, arr|
      if @echo
        arr << lyrics[i] + ' ' + lyrics[i]
      else
        arr << lyrics[i]
      end
    end.join(' ')

    verse_number = index + 1

    'Couplet ' + verse_number.to_s + ': ' + verse
  end
end
