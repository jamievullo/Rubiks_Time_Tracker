class Cuber < ActiveRecord::Base
    
    has_secure_password
    has_many :cube_times
    has_many :cube_types, through: :cubes

    validates :name, presence: true
    validates :name, presence: true, uniqueness: true 
    
end
