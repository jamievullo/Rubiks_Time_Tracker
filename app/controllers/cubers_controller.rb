class CubersController < ApplicationController

  get '/cubers/login' do
    erb :'/cuber/login'
  end

  post '/cubers/login' do
    cuber = Cuber.find_by(username: params[:username])
    if cuber && cuber.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/cubers/account' #???
    else
    redirect '/cubers/login'
    end
  end

  get '/cubers/signup' do
    erb :'/cuber/signup'
  end 


  # GET: /cubers
  get "/cubers" do
    @cubers = Cuber.all
    erb :"/cubers/index"
  end

  # GET: /cubers/new
  get "/cubers/new" do
    erb :"/cubers/new"
  end

  # POST: /cubers
  post "/cubers" do
    redirect "/cubers"
  end

  # GET: /cubers/5
  get "/cubers/:id" do
    @cuber = Cuber.find(params[:id])
    erb :"/cubers/show"
  end

  # GET: /cubers/5/edit
  get "/cubers/:id/edit" do
    @cuber = Cuber.find(params[:id])
    erb :"/cubers/edit"
  end

  # PATCH: /cubers/5
  patch "/cubers/:id" do
    redirect "/cubers/:id"
  end

  # DELETE: /cubers/5/delete
  delete "/cubers/:id/delete" do
    redirect "/cubers"
  end
end
