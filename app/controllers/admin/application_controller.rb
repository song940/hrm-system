class Admin::ApplicationController < ApplicationController
	layout "admin"
	
	before_action :signed_in_user
	before_filter :require_admin

	def require_admin
		flash[:error] = "Admin access required ." unless current_user.admin?
		redirect_to root_url unless current_user && current_user.admin?
	end

end