class Cuber < ActiveRecord::Base
    has_secure_password
    has_many :cubes 
    has_many :cube_times
end
