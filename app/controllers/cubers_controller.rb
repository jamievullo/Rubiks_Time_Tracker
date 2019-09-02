class CubersController < ApplicationController

  get "/cubers" do
    @cubers = Cuber.all

    erb :"/cubers/index"
  end

  get "/cubers/new" do

    erb :"/cubers/new"
  end

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
