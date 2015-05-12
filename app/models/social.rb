class Social < ActiveRecord::Base

	before_create :set_uri

	attr_accessible :user_id,:category,:profile,:uri,:created_at,:updated_at

	validates_presence_of :user_id, :category, :profile

	def set_uri

		self.profile = self.profile.gsub(' ','')

		if self.profile.scan(/\Ahttp:\/\/|\Ahttps:\/\//i).count > 0
			self.uri = self.profile
		else
			self.uri = "https://www.#{self.category}.com/#{self.profile}"
		end

	end

end