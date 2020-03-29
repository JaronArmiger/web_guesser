require 'sinatra'
require 'sinatra/reloader'

num = rand(101)

get '/' do
	erb :index, :locals => {:num => num}
end