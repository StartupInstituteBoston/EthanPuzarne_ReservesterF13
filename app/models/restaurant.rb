class Restaurant < ActiveRecord::Base
  belongs_to :restaurant
  mount_uploader :photo, PhotoUploader
end
