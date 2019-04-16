f = File.new("Gemfile","a")
f = File.new(".env","a")
f = File.new("gitignore","a")
f = File.new("ReadMe.md","a")
Dir.mkdir("lib")

file = File.open("Gemfile", "a")
file.puts('source "https://rubygems.org"')
file.puts("gem 'pry'")
file.puts("ruby '2.5.1'")
file.puts("gem 'rspec'")
file.puts("gem 'dotenv'")
file.close

file = File.open("gitignore", "a")
file.puts(".env")
file.close


file = File.open("ReadMe.md", "a")
file.puts("C'est un programme Ruby")
file.close

file = File.open("Gemfile", "r")
puts "Voici le contenu de ton Gemfile :"
puts file.read
file.close

system("rspec --init")
system("git --init")
system("bundle install")