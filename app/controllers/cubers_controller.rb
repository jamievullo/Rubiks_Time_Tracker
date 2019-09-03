class CubersController < ApplicationController

  get "/cubers/index" do
    if logged_in?
      @cuber = current_cuber
      @cube_times = CubeTime.where("cuber_id = ?", @cuber.id)
      @best_cube_time = @cube_times.order(cube_time: :asc).first
      @average_cube_time = @cube_times.sum("cube_time")/@cube_times.count
      erb :"/cubers/index"
    else

      redirect "/login"
    end 
  end
end
