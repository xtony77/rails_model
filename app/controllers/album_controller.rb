class AlbumController < ApplicationController
	before_action :check_album_group, :only => [:index, :show]
	before_action :find_album_id, :only => [:show]

	def index
		@album = Album.where(:group => params[:group]).order("sequence ASC, id DESC").page(params[:page])
		album_id = @album.map{|f| f.id}[0]
		@photo = Photos.where(:album_id => album_id).limit(1)
	end

	def show
		@album = Album.find(params[:id])
		@photo = Photos.where("`group` = ? AND `album_id` = ?", params[:group], params[:id])
	end

	private
		def find_album_id
			@album = Album.find(params[:id])
		end

		def check_album_group
			album_group_name = ApplicationController.helpers.album_group_name(params[:group])
			if album_group_name.blank? || album_group_name.match("group")
				redirect_to admin_root_path
			end
		end
end
