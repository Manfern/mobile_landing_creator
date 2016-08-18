class Feedback < ApplicationRecord
  belongs_to :page
  validates :description, :author, :photo, presence: true
  mount_uploader :photo, PhotoUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def crop_photo
    photo.recreate_versions! if crop_x.present?
  end

end
