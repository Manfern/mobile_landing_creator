class Page < ApplicationRecord
  has_many :advantages
  has_many :feedbacks
  has_many :offers
  accepts_nested_attributes_for :advantages, :feedbacks, :offers
  validates :name, :title, :offer, :footer_text, :design, presence: true
end
