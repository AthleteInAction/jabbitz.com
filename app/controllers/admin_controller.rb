class AdminController < ApplicationController

	before_filter :admin_only
	
	def index

		render layout: 'admin'

	end

end