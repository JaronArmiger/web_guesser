require 'sinatra'
require 'sinatra/reloader'

set :num, rand(101)

get '/' do
	guess = params['guess'].to_i
	message = check_guess(guess)
	erb :index, :locals => {:num => settings.num, :message => message}
end

def check_guess(guess)
	num = settings.num
	if guess == 0
		message = nil
	elsif guess > (num + 5)
		message = 'Way too high!'
	elsif guess < (num - 5)
		message = 'Way too low!'
	elsif guess > num
		message = 'Too high!'
	elsif guess < num
		message = 'Too low!'
	elsif
		message = 'You got it right!'
	end
	message
end