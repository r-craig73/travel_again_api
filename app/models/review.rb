class Review < ActiveRecord::Base
  validates :city, :presence => true

  scope :search_city, -> (city) { where("city like ?", "%#{city}%")}

end
