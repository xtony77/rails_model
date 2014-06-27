class Admin::AlbumController < Admin::ApplicationController
	before_action :check_album_group, :only => [:index, :show, :new, :edit]
	before_action :find_album_id, :only => [:show, :edit, :update, :destroy]

	def index
		@admin_album = Album.where(:group => params[:group]).order("sequence ASC, id DESC").page(params[:page])
	end

	def show
		@admin_photo = Photos.where("`group` = ? AND `album_id` = ?", params[:group], params[:id])
	end

	def new
		@admin_album = Album.new
	end

	def create
		@admin_album = Album.new(admin_album_params)
		if @admin_album.save
			flash[:notice] = "successfully"
			redirect_to admin_album_index_path
		else
			flash[:alert] = "error"
			render :action => :new
		end
	end

	def edit
	end

	def update
		if @admin_album.update(admin_album_params)
			flash[:notice] = "successfully"
			redirect_to admin_album_index_path
		else
			flash[:alert] = "error"
			render :action => :edit
		end
	end

	def destroy
		@admin_photo = Photos.where(:album_id => params[:id])
		@admin_photo.each do |p|
			FileUtils.remove_dir("#{Rails.root}/public/uploads/photos/file/#{p.id}", true)
			p.destroy
		end
		@admin_album.destroy
		redirect_to admin_album_index_path
	end

	def photo_new
		@admin_photo = Photos.new
	end

	def photo_create
		params[:upload_files].each do |file|
			@admin_photo = Photos.create(group: params[:photos][:group], album_id: params[:photos][:album_id], admin_id: params[:photos][:admin_id], file: file)
		end
		redirect_to admin_album_path(params[:group], params[:album_id])
	end

	def photo_destroy
		params[:delete_id_array].each do |d|
			FileUtils.remove_dir("#{Rails.root}/public/uploads/photos/file/#{d}", true)
			@admin_photo = Photos.find(d)
			@admin_photo.destroy
		end
		redirect_to admin_album_path(params[:group], params[:album_id])
	end

	private
		def find_album_id
			@admin_album = Album.find(params[:id])
		end

		def admin_album_params
			@admin_album = params.require(:album).permit(:group, :title, :content, :admin_id)
		end

		def check_album_group
			album_group_name = ApplicationController.helpers.album_group_name(params[:group])
			if album_group_name.blank? || album_group_name.match("group")
				redirect_to admin_root_path
			end
		end
end
