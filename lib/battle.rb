require 'sinatra/base'

class Battle < Sinatra::Base
  get '/' do
    'Hello Battle!'
  end

  get '/names' do
    erb :index
  end

  post '/names' do
    @name1 = params[:player_1_name]
    @name2 = params[:player_2_name]
    p params[:player_1_name]
    p params[:player_2_name]
    erb :play
  end

  get '/play' do
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
