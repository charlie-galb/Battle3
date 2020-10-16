require 'sinatra'
require './lib/player.rb'
require './lib/game.rb'


class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player1_name])
    $player_2 = Player.new(params[:player2_name])
    $game = Game.new
    redirect '/play'
  end

  get '/play' do
    @player1_name = $player_1.name
    @player2_name = $player_2.name
    @player1_HP = $player_1.hp
    @player2_HP = $player_2.hp
    @battle_log = $game.log[-1]
    erb(:play)
  end

  # get '/attack' do
  #   @Player1_Name = session[:Player1_Name]
  #   @Player2_Name = session[:Player2_Name]
  #   erb(:attack)
  # end

  post "/attack" do
    $game.attack($player_1, $player_2)
    redirect "/play"
  end




  # start the server if ruby file executed directly
  run! if app_file == $0


end
