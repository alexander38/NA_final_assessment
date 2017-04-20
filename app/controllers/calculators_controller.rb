class CalculatorsController < ApplicationController

	def index
	end

	def calculator
		@search = params[:calculator][:search]
		respond_to do |format|
			format.js
		end
	end
	
end
