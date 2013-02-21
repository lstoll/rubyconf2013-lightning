require 'sinatra'
require 'pg'
require 'sequel'

Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

get '/' do
  erb :index
end
