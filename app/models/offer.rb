class Offer < ApplicationRecord
  belongs_to :page
  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image

  def crop_image
    image.recreate_versions! if
        crop_x.present?
  end

end
    #               :zoom_w, :zoom_h, :zoom_x, :zoom_y, :drag_x, :drag
  # attr_accessor :crop_x, :crop_y, :crop_w, :crop_h, :rotation_angle,
  #               :zoom_w, :zoom_h, :zoom_x, :zoom_y, :drag_x, :drag
# end
