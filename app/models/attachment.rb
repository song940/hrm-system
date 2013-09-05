class Attachment < ActiveRecord::Base
  belongs_to :employee

  mount_uploader :file, FileUploader
end
