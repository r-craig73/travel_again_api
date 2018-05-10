class Review < ActiveRecord::Base
  validates :city, :presence => true
  validates :comment, :presence => true

  scope :search_city, -> (city) { where("city like ?", "%#{city}%")}

end
