class About < ActiveRecord::Base
	validates_presence_of :group, :content, :admin_id
end
