class AboutController < ApplicationController
	before_action :check_about_group

	def index
		@about = About.where(:group => params[:group])
	end

	private
		def check_about_group
			about_group_name = ApplicationController.helpers.about_group_name(params[:group])
			if about_group_name.blank? || about_group_name.match("group")
				redirect_to admin_root_path
			end
		end
end
