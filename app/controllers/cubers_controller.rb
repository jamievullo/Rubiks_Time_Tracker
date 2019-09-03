class CubersController < ApplicationController

  get "/cubers/index" do
    #if logged_in?
    @cuber = current_cuber
    @cube_time = CubeTime.where("cuber_id = ?", @cuber.id)
      #binding.pry
    
    erb :"/cubers/index"
  end

end
