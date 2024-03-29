require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "cube_secret" 
  end

  get '/' do
    
    erb :index
  end

  helpers do 

    def logged_in? 
      !!current_cuber
    end

    def current_cuber
      @current_cuber ||= Cuber.find_by(id: session[:user_id]) if session[:user_id]
    end

    def cube_types
      ["2x2", "3x3", "4x4", "5x5", "3x3-OH", "3x3-BF", "3x3-FM", "Megaminx", "Pyraminx", "Skewb", "Square-1", "6x6", "7x7"]
    end

    def is_number?(arg)
      true if Float(arg) rescue false
    end

  end

end
