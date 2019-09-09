class CubersController < ApplicationController

  CUBETYPES = ["2x2", "3x3", "4x4", "5x5", "6x6", "7x7"]

  get "/cubers/index" do
    if logged_in?
      @cubetypes = CUBETYPES
      @cuber = current_cuber
      @cube_times = CubeTime.where("cuber_id = ?", @cuber.id)
      @best_cube_time = @cube_times.order(cube_time: :asc).first
      @average_cube_time = @cube_times.sum("cube_time")/@cube_times.count
      @last_5 = @cube_times.last(5)
      
      erb :"/cubers/index"
    else

      redirect "/login"
    end 
  end
end
