class ApplicationController < ActionController::Base
	
	before_action :categories

	def categories
		@categories = Category.order(:name)
	end
end
