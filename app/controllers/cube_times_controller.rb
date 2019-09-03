class CubeTimesController < ApplicationController

  get "/cube_times" do
    if logged_in?
      @cuber = current_cuber
      erb :"/cube_times/index"
    else  
      redirect '/login'
    end
  end

  get "/cube_times/new" do
    if logged_in?
      @cube_times = CubeTime.all
      erb :"/cube_times/new"
    else  
      redirect '/login'
    end
  end

  post "/cube_times" do
    if logged_in?
      if params[:cube_time] == ""

        redirect '/cube_times/new'
      else
        @cube_time =  CubeTime.create(params)
        @cube_time.cuber_id = current_cuber.id
        if @cube_time.save
          
          redirect "/cube_times/#{@cube_time.id}"
        else  
          redirect '/cube_times/new'
        end
      end
    else
      redirect '/login'
    end
  end

  # GET: /cube_times/5
  get "/cube_times/:id" do
    erb :"/cube_times/show"
  end

  get "/cube_times/:id/edit" do
    if logged_in?
      @cube_time = CubeTime.find_by_id(params[:id])
      if @cube_time && @cube_time.cuber == current_cuber
        erb :'cube_times/edit_cube_time'
      else
        redirect to '/cube_times'
      end
    else
      redirect to '/login'
    end
    erb :"/cube_times/edit"
  end

  # # PATCH: /cube_times/5
  # patch "/cube_times/:id" do
  #   redirect "/cube_times/:id"
  # end

  # # DELETE: /cube_times/5/delete
  # delete "/cube_times/:id/delete" do
  #   redirect "/cube_times"
  # end
end
