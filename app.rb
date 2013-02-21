require 'sinatra'
require 'pg'
require 'sequel'
require 'pry'

DB = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost:5565/rclightning')
TALKS = DB[:talks]

################
# Logic and shit
################

def valid_submission?(params)
  %w(name email title description).map do |field|
    f = field.to_sym
    params[f] && !params[f].empty?
  end.all?
end

def save_submission(params)
  TALKS.insert(params.reject {|k,v| ![:name, :email, :title, :description].include?(k)})
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
