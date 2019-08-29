class CubersController < ApplicationController

  # GET: /cubers
  get "/cubers" do
    @cubers = Cuber.all
    erb :"/cubers/index.html"
  end

  # GET: /cubers/new
  get "/cubers/new" do
    erb :"/cubers/new.html"
  end

  # POST: /cubers
  post "/cubers" do
    redirect "/cubers"
  end

  # GET: /cubers/5
  get "/cubers/:id" do
    @cuber = Cuber.find(params[:id])
    erb :"/cubers/show.html"
  end

  # GET: /cubers/5/edit
  get "/cubers/:id/edit" do
    @cuber = Cuber.find(params[:id])
    erb :"/cubers/edit.html"
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
