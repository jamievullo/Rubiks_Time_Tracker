class CubersController < ApplicationController

  get "/cubers/:id" do
    if logged_in?
      @cuber = current_cuber
      @cube_times = CubeTime.where("cuber_id = ?", @cuber.id)
      @best_cube_time = @cube_times.order(cube_time: :asc).first
      @average_cube_time = @cube_times.sum("cube_time")/@cube_times.count
      @last_5 = @cube_times.last(5)
      
      erb :"/cubers/show"
    else

      redirect "/login"
    end 
  end
end
