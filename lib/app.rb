require 'sinatra/base'
require 'rack'
require_relative 'player.rb'
require_relative 'game.rb'
# enable :sessions

class Battle < Sinatra::Base
  use Rack::Session::Pool, :expire_after => 2592000
  set :session_secret, "super secret"

  STARTING_HP = 100
  ATTACK_HP = 10

  get '/' do
    erb :home
  end

  get '/sign_up' do
    erb :player_sign_up
  end

  post '/names' do
    @player_one = Player.new(params[:player_one_name])
    @player_two = Player.new(params[:player_two_name])
    $game = Game.new(@player_one, @player_two)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/attack' do
    $game.attack($game.player_not_playing)
    if $game.player_lost?
      redirect '/battle_over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    $game
    erb :attack
  end

  get '/battle_over' do
    erb :battle_over
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
