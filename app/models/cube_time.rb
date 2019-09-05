class CubeTime < ActiveRecord::Base
    
    belongs_to :cuber
    belongs_to :cube_type

end
