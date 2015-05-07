class Chime < ActiveRecord::Base

	attr_accessible :flagged, :author_id, :user_id, :category, :rating, :interaction_date, :site, :body, :employer, :job_title, :location, :school, :created_at, :updated_at

	belongs_to :author,class_name: 'User',foreign_key: :author_id

	validates_presence_of :user_id, :category, :body

end