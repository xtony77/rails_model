class News < ActiveRecord::Base
	validates_presence_of :group, :title, :content, :top, :admin_id
end
