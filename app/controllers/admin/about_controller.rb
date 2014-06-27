class Admin::AboutController < Admin::ApplicationController
	before_action :check_about_group, :only => [:index, :new, :edit]
	before_action :find_about_id, :only => [:edit, :update, :destroy]

	def index
		@admin_about = About.where(:group => params[:group])
	end

	def new
		@admin_about = About.new
	end

	def create
		@admin_about = About.new(admin_about_params)
		if @admin_about.save
			flash[:notice] = "successfully"
			redirect_to admin_about_index_path
		else
			flash[:alert] = "error"
			render :action => :new
		end
	end

	def edit
	end

	def update
		if @admin_about.update(admin_about_params)
			flash[:notice] = "successfully"
			redirect_to admin_about_index_path
		else
			flash[:alert] = "error"
			render :action => :edit
		end
	end

	def destory
		@admin_about.destory
		redirect_to admin_about_index_path
	end

	private
		def find_about_id
			@admin_about = About.find(params[:id])
		end

		def admin_about_params
			params.require(:about).permit(:group, :content, :admin_id)
		end

		def check_about_group
			about_group_name = ApplicationController.helpers.about_group_name(params[:group])
			if about_group_name.blank? || about_group_name.match("group")
				redirect_to admin_root_path
			end
		end
end
