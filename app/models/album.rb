class Album < ActiveRecord::Base
	has_many :photos
	accepts_nested_attributes_for :photos, :reject_if => :all_blank
end
