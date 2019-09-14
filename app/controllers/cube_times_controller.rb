class CubeTimesController < ApplicationController

  get "/cube_times" do
    if logged_in?
      @cuber = current_cuber
      erb :"/cubers/show"
    else  
      redirect '/login'
    end
  end

  get "/cube_times/new" do
    @cuber = current_cuber
    if logged_in?

      erb :"/cube_times/new"
    else  
      redirect '/login'
    end
  end

  post "/cube_times" do
    #binding.pry
    if logged_in?
      #raise params.inspect
      if params[:cube_time] == "" || !params.include?(:cubetype)

        redirect '/cube_times/new'
      else
        if is_number?(params[:cube_time])
          @cube_time = CubeTime.create(cube_time: params[:cube_time], cube_type: params[:cubetype])
          @cube_time.cuber_id = current_cuber.id
          if @cube_time.save
          
            redirect "/cube_times/#{@cube_time.id}"
          else  
            redirect '/cube_times/new'
          end
        else
            redirect :"/sessions/error"
        end
      end
    else
      redirect '/login'
    end
  end

  get "/cube_times/:id" do    
    if logged_in?
      @cuber = current_cuber
      #binding.pry
      @cube_time = CubeTime.find_by_id(params[:id])
      if @cube_time
        erb :"/cube_times/show"
      else 
        erb :"/sessions/error"
      end
      else 
      redirect "/login" 
      
    end
  end

  get "/cube_times/type/:cube_type" do 
    if logged_in? 
      @type = params[:cube_type]
      @cuber = current_cuber
      @times = CubeTime.where(cuber_id: @cuber.id).where(cube_type: params[:cube_type])
      if @times.empty? 
        redirect '/cube_times'
      else
       @best_cube_time = @times.order(cube_time: :asc).first
       @average_cube_time = @times.sum("cube_time")/@times.count
       @last_5 = @times.last(5)
       erb :"/cube_times/type" 
      end
    else
      redirect '/login'
    
    end  
  end

  get "/cube_times/:id/edit" do
    if logged_in?
      @cuber = current_cuber
      @cube_time = CubeTime.find_by_id(params[:id])
      if @cube_time && @cube_time.cuber_id == current_cuber.id
        erb :'cube_times/edit'
      else
        redirect to '/cube_times'
      end
    else
      redirect to '/login'
    end
    erb :"/cube_times/edit"
  end

  patch "/cube_times/:id" do
    if logged_in?
      @cuber = current_cuber
      @cube_time = CubeTime.find_by_id(params[:id]) 
      @cube_time.cube_time = params[:cube_time]
      @cube_time.save
    
      redirect "/cube_times/#{@cube_time.id}"
    else
      redirect "/login"
    end
  end

  delete "/cube_times/:id/delete" do
    if logged_in?
      @cuber = current_cuber
      @cube_time = CubeTime.find_by_id(params[:id])
      @cube_time.destroy

      redirect "/cubers/show"
    else 
      redirect "/login"   
    end
  end
end
