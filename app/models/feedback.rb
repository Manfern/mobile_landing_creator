class Feedback < ApplicationRecord
  after_update :crop_photo
  belongs_to :page
  validates :description, :author, presence: true
  mount_uploader :photo, PhotoUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def crop_photo
    photo.recreate_versions! if crop_x.present?
  end

end
