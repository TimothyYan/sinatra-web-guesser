require 'sinatra'
require 'sinatra/reloader'

secret_number = rand(101)
message = "too high!"


get '/' do
  guess = params["guess"].to_i
  if guess > secret_number
    "too high!"
  end
  
  erb :index, :locals => { :secret_number => secret_number,  :message => message, :guess => guess }
end