class Review < ActiveRecord::Base


  #review belongs to a user

  belongs_to :user


  # Geocoded

  geocoded_by :address
  after_validation :geocoded

  has_many :reviews, dependent: :destroy

end
