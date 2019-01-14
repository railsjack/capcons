class HomeController < ApplicationController
	respond_to :html,:json
	def index
		respond_to do |format|
	        format.html
	        format.json { render :json=> true }
		end
	end
end
