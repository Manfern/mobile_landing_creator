class Offer < ApplicationRecord
  after_update :crop_image
  belongs_to :page
  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  validates :page_id, :discount, :name, :price, :price_old, :button_text, presence: true
  validates :price, numericality: true
  validates :price_old, numericality: true
  validates :discount, numericality: true
  validates :link, url: true

  def crop_image
    image.recreate_versions! if crop_x.present?
  end

# validations


end
