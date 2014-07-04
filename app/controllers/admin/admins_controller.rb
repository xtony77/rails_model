class Admin::AdminsController < Admin::ApplicationController
	before_action :check_super_admin
	before_action :find_admin_id, :only => [:destroy]

	def index
		@admin = Admin.all.page(params[:page])
	end

	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.new(admin_params)
		if @admin.save
			flash[:notice] = "successfully"
			redirect_to admin_admins_path
		else
			flash[:alert] = "error"
			render :action => :new
		end
	end

	def destroy
		if params[:id] != 1
			@admin.destroy
		end
		redirect_to admin_admins_path
	end

	private
		def find_admin_id
			@admin = Admin.find(params[:id])
		end

		def admin_params
			params.require(:admin).permit(:email, :password, :password_confirmation)
		end

		def check_super_admin
			if current_admin.id != 1
				redirect_to admin_root_path
			end
		end
end
