require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "cube_secret"
  end

  get "/" do
    erb :index
  end

  helpers do 

    def logged_in? 
      !!current_cuber
    end

    def current_cuber
      @current_cuber ||= Cuber.find_by(id: session[:user_id]) if session[:user_id]
    end

    def authenticate
      if logged_in?
        redirect '/login'
      end
    end


  end

end
