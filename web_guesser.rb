require 'sinatra'
require 'sinatra/reloader'

num = rand(101)

get '/' do
	"The secret NUMBER is #{num}"
end