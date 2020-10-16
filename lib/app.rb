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
    $game = Game.new(Player.new(params[:player1_name]), Player.new(params[:player2_name]))
    redirect '/play'
  end

  get '/play' do
    @player1_name = $game.player1_name
    @player2_name = $game.player2_name
    @player1_HP = $game.player1_hp
    @player2_HP = $game.player2_hp
    @battle_log = $game.log[-1]
    erb(:play)
  end

  # get '/attack' do
  #   @Player1_Name = session[:Player1_Name]
  #   @Player2_Name = session[:Player2_Name]
  #   erb(:attack)
  # end

  post "/attack" do
    $game.p1_attack
    redirect "/play"
  end




  # start the server if ruby file executed directly
  run! if app_file == $0


end
