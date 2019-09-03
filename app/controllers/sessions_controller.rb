class SessionsController < ApplicationController

    get '/login' do

        erb :'/sessions/login'
    end

    post '/login' do
        cuber = Cuber.find_by(name: params[:name])
        if !!cuber && cuber.authenticate(params[:password])
            session[:user_id] = cuber.id

            redirect '/cube_times'
        else
            redirect '/sessions/login'
        end
    end

    get '/signup' do

        erb :'/sessions/signup'
    end

    post '/signup' do 
        if params[:name] == "" || params[:password] == ""

            redirect "/signup"
        else
            @cuber = Cuber.new(params)
            @cuber.save
            session[:user_id] = @cuber.id
            #binding.pry
            redirect "/cube_times"
        end    
    end  
    
    get '/logout' do
        session.clear
        
        redirect '/'
    end

end