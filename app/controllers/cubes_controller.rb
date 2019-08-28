class CubesController < ApplicationController

  # GET: /cubes
  get "/cubes" do
    erb :"/cubes/index.html"
  end

  # GET: /cubes/new
  get "/cubes/new" do
    erb :"/cubes/new.html"
  end

  # POST: /cubes
  post "/cubes" do
    redirect "/cubes"
  end

  # GET: /cubes/5
  get "/cubes/:id" do
    erb :"/cubes/show.html"
  end

  # GET: /cubes/5/edit
  get "/cubes/:id/edit" do
    erb :"/cubes/edit.html"
  end

  # PATCH: /cubes/5
  patch "/cubes/:id" do
    redirect "/cubes/:id"
  end

  # DELETE: /cubes/5/delete
  delete "/cubes/:id/delete" do
    redirect "/cubes"
  end
end
