class CubeTimesController < ApplicationController

  # GET: /cube_times
  get "/cube_times" do
    @cuber = current_cuber
    # @cube_times = 
    erb :"/cube_times/index"
  end

  # GET: /cube_times/new
  get "/cube_times/new" do
    erb :"/cube_times/new"
  end

  # POST: /cube_times
  post "/cube_times" do
    raise params.inspect
    #redirect "/cube_times"
  end

  # # GET: /cube_times/5
  # get "/cube_times/:id" do
  #   erb :"/cube_times/show"
  # end

  # # GET: /cube_times/5/edit
  # get "/cube_times/:id/edit" do
  #   erb :"/cube_times/edit"
  # end

  # # PATCH: /cube_times/5
  # patch "/cube_times/:id" do
  #   redirect "/cube_times/:id"
  # end

  # # DELETE: /cube_times/5/delete
  # delete "/cube_times/:id/delete" do
  #   redirect "/cube_times"
  # end
end
