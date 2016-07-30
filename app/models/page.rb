class Page < ApplicationRecord
  has_many :advantages
  has_many :feedbacks
  has_many :offers

end
