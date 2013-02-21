require 'sinatra'
require 'pg'
require 'sequel'
require 'pry'

Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

get '/' do
  'Hello world!'
end

# REPL me up if we're launched directly
if __FILE__ == $0
  binding.pry
  exit
end
