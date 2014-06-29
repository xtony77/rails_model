class IndexController < ApplicationController
	def index
		@news = News.where(:group => 1).order("top DESC, id DESC").limit(5)
		@photos = Photos.where(:group => 1).order("id DESC").limit(5)
	end
end
