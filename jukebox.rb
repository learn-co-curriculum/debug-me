def jukebox(command, lib)
  if command.downcase == "list"
    list_library
  else
    parse_command(command, lib)
  end
end

def list_library(lib)
  lib.each do |artist, album_hash|
    puts "#{artist}:"
    album_hash.each do |k,v|
      puts "  #{v.keys[0]}:"
      v.each{ |k2,v2| puts "    #{v2[:songs].join(', ')}" }
    end
  end
end

def parse_command(command, lib)
  command = command.downcase.split(" ").map{ |word| word[0].upcase + word[1..word.length] }.join(" ")
  artists = lib.keys
  songs_array = []
  lib.each do |artist, albums|
    albums[:albums].each do |title, songs|
      songs_array << songs[:songs]
      songs_array.flatten!
    end
  end
  if artists.include?(command)
    list_artist_songs(command, lib)
  elsif songs_array.include?(command)
    play_song(command, lib)
  else
    puts "Command not recognized"
  end
end

def list_artist_songs(command, lib)
  array = []
  lib[command][:albums].each do |key, value|
    array.concat(value[:songs])
  end
  puts array.join(", ")
end

def play_song(command, lib)
  lib.each do |artist, albums|
    albums[:albums].each do |title, songs|
      if songs[:songs].include?(command)
        puts "Now playing #{artist}: #{title}: #{command}"
      end
    end
  end
end
