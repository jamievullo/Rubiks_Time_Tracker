class Cube < ActiveRecord::Base
    belongs_to :cubers 
    has_many :times, through: :cubers
end
