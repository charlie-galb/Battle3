require 'sinatra'
require './lib/hp_calculator.rb'
require './lib/battle_log.rb'


class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player1_name])
    $player_2 = Player.new(params[:player2_name])
    session[:player1_HP] = "60"
    session[:player2_HP] = "60"
    redirect '/play'
  end

  get '/play' do
    @player1_name = $player_1.name
    @player2_name = $player_2.name
    @player1_HP = session[:player1_HP]
    @player2_HP = session[:player2_HP]
    @battle_log = session[:battle_log]
    erb(:play)
  end

  # get '/attack' do
  #   @Player1_Name = session[:Player1_Name]
  #   @Player2_Name = session[:Player2_Name]
  #   erb(:attack)
  # end

  post "/attack" do
    session[:player2_HP]
    session[:player2_HP] = minus(session[:player2_HP])
    session[:battle_log] = attack($player_1.name, $player_2.name)
    redirect "/play"
  end




  # start the server if ruby file executed directly
  run! if app_file == $0


end
