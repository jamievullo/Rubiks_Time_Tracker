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
      ["2x2", "3x3", "4x4", "5x5", "6x6", "7x7"]
    end

  end

end
