class Photos < ActiveRecord::Base
	belongs_to :album, :polymorphic => true
	before_save :update_photo_attributes
  
  mount_uploader :file, PhotoUploader
  
  private
	  def update_photo_attributes
	    if file.present? && file_changed?
	      self.name         = file.file.filename
	      self.size         = file.file.size
	      self.content_type = file.file.content_type
	    end
	  end
end
