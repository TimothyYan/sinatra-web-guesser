require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => { :number => SECRET_NUMBER,  :message => message }
end

def check_guess(guess)
  if guess.nil?
    "Enter a number."
  elsif guess > SECRET_NUMBER + 5
    "Way too high."
  elsif guess < SECRET_NUMBER - 5
    "Way too low."
  elsif guess > SECRET_NUMBER
    "Too high."
  elsif guess < SECRET_NUMBER
    "Too low."
  elsif guess == SECRET_NUMBER
    "Correct! The secret number is #{SECRET_NUMBER}."
  end
end