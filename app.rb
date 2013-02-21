require 'sinatra'
require 'pg'
require 'sequel'
require 'pry'

Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

################
# Logic and shit
################

def valid_submission?(params)
  %w(name email title description).map do |field|
    f = field.to_sym
    params[f] && !params[f].empty?
  end.all?
end

################
# Web App
################

get '/' do
  erb :index
end

# REPL me up if we're launched directly
if __FILE__ == $0
  binding.pry
  exit
end
