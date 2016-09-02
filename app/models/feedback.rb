class Feedback < ApplicationRecord
  after_update :crop_image
  belongs_to :page
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  validates :description, :author, presence: true
  mount_uploader :image, ImageUploader
  # process_in_background :image

  def crop_image
    image.recreate_versions! if crop_x.present?
  end

end
