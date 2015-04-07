class Social < ActiveRecord::Base

	attr_accessible :user_id,:uri,:created_at,:updated_at

	validates_presence_of :uri

end