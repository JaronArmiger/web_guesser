require 'sinatra'
require 'sinatra/reloader'

@@guesses_left = 5

def set_num
	puts ""
	puts " set_num CALLED"
	puts ""
	if settings.num
		settings.num = rand(101)
	else
		set :num, rand(101)
	end
end



def run
	get '/' do
		guess = params['guess'].to_i
		cheat = params['cheat']
		puts ""
		print "cheat"; p cheat
		
		puts "guess: #{guess}"
		puts "guesses_left: #{@@guesses_left}"
		puts "num: #{settings.num}"
		puts ''
		message = check_guess(guess)
		if message == 'You got it right!'
			old_num = settings.num
			set_num
		else
			old_num = 0
		end
		erb :index, :locals => {:num => settings.num, 
								:message => message, 
								:old_num => old_num,
								:cheat => cheat }
		end
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
	
	if @@guesses_left == 0
		#generate_num
		puts ""
		puts "no guesses"
		puts ""
		message = "No more guesses :( The number was #{num}\n Generating new number!"
		set_num
		@@guesses_left = 5
	else
		@@guesses_left -= 1
	end
	
	message

end
set_num
run
