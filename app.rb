require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'pg'
require 'pry'
require 'sinatra/flash'


configure :development, :test do
  require 'pry'
end

configure do
  enable :sessions
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/PhantasyPhootball' do

  erb :index
end

get '/PhantasyPhootball/Predictions' do

  erb :predictions
end

post '/prediction/submit' do

  if params.values.any? { |submission| submission.empty? }
    flash.next[:notice] = "No blank submissions!"
    redirect '/PhantasyPhootball/Predictions'
  else
    flash.next[:notice] = "Predictions submitted!"
    redirect '/PhantasyPhootball/Predictions'
  end
end
