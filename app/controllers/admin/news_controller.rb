class Admin::NewsController < Admin::ApplicationController
	before_action :check_news_group, :only => [:index, :new, :edit]
	before_action :find_news_id, :only => [:edit, :update, :destroy]

	def index
		sql_query = ["`group` = ?", params[:group]]
		if !params[:search].blank?
			sql_query = ["`group` = ? AND `title` LIKE ?", params[:group], "%#{params[:search]}%" ]
		end

		@admin_news = News.where(sql_query).order("top DESC, id DESC").page(params[:page])
	end

	def new
		@admin_news = News.new
	end

	def create
		@admin_news = News.new(admin_news_params)
		if @admin_news.save
			flash[:notice] = "successfully"
			redirect_to admin_news_index_path
		else
			flash[:alert] = "error"
			render :action => :new
		end
	end

	def edit
	end

	def update
		if @admin_news.update(admin_news_params)
			flash[:notice] = "successfully"
			redirect_to admin_news_index_path
		else
			flash[:alert] = "error"
			render :action => :edit
		end
	end

	def destroy
		@admin_news.destroy
		redirect_to admin_news_index_path
	end

	private
		def find_news_id
			@admin_news = News.find(params[:id])
		end

		def admin_news_params
			params.require(:news).permit(:group, :title, :content, :top, :admin_id)
		end

		def check_news_group
			news_group_name = ApplicationController.helpers.news_group_name(params[:group])
			if news_group_name.blank? || news_group_name.match("group")
				redirect_to admin_root_path
			end
		end
end
