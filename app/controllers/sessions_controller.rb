class SessionsController < ApplicationController

    get '/login' do
        @failed = false
        erb :'sessions/login'
    end

    post '/login' do
        cuber = Cuber.find_by(name: params[:name])
        if !!cuber && cuber.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/cubers/cube_times' #???
        else
            @failed = true
            redirect '/sessions/login'
        end
    end

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do 
        

    end


end
