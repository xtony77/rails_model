class NewsController < ApplicationController
	before_action :check_news_group
	before_action :find_news_id, :only => [:show]

	def index
		@news = News.where(:group => params[:group]).order("top DESC, id DESC").page(params[:page])
	end

	def show
	end

	private
		def find_news_id
			@news = News.find(params[:id])
		end

		def check_news_group
			news_group_name = ApplicationController.helpers.news_group_name(params[:group])
			if news_group_name.blank? || news_group_name.match("group")
				redirect_to root_path
			end
		end
end
