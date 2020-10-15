require 'sinatra'

class Battle < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/names' do
    @Player1_Name = params[:Player1_Name]
    @Player2_Name = params[:Player2_Name]
    erb(:names)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0


end
