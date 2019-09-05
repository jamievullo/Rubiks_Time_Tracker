class CubeType < ActiveRecord::Base

    belongs_to :cuber
    has_many :cube_times

end
