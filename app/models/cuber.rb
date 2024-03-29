class Cuber < ActiveRecord::Base
    
    has_secure_password
    has_many :cube_times
    
    validates :name, presence: true
    validates :name, presence: true, uniqueness: true 
    
end
