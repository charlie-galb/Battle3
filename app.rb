require 'sinatra'
require './actions.rb'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:Player1_Name] = params[:Player1_Name]
    session[:Player2_Name] = params[:Player2_Name]
    session[:Player1_HP] = "60"
    session[:Player2_HP] = "60"
    redirect '/play'
  end

  get '/play' do
    @Player1_Name = session[:Player1_Name]
    @Player2_Name = session[:Player2_Name]
    @Player1_HP = session[:Player1_HP]
    @Player2_HP = session[:Player2_HP]
    erb(:play)
  end

  # get '/attack' do
  #   @Player1_Name = session[:Player1_Name]
  #   @Player2_Name = session[:Player2_Name]
  #   erb(:attack)
  # end

  post "/attack" do
    session[:Player2_HP]
    session[:Player2_HP] = attack(session[:Player2_HP])
    redirect "/play"
  end




  # start the server if ruby file executed directly
  run! if app_file == $0


end
