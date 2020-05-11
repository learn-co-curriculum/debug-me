require_relative './jukebox.rb'
require_relative './song_library.rb'

def run
  puts "Welcome to Ruby Console Jukebox!"
  puts "Enter a command to continue. Type 'help' for a list of commands."
  command = gets.chomp
  while command.downcase != "exit"
    run_command(command)
    puts "Enter a command to continue. Type 'help' for a list of commands."
    command = gets.chomp
  end
end

def run_command(command)
  case command
  when "help"
    show_help
  when "list"
    list_library(full_library)
  else
    jukebox(command, full_library)
  end
end

def show_help
  help = "Never worked a jukebox, eh? Pretty standard. Available commands are:\n"
  help += "'help' - shows this menu\n"
  help += "'list' - lists the whole song library\n"
  help += "or you can enter an artist's name to show that artist's songs\n"
  help += "or you can enter a song title to play that song!  "
  puts help
end

run
