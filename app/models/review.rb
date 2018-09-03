class Review < ApplicationRecord

  #add association that has a 1 to many relationship
  has_many :comments

  geocoded_by :address
  after_validation :geocode

  validates :title, presence: true
  validates :body, length: {minimum: 10}
  validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 10, }
  validates :restaurant, presence: true
  validates :address, presence: true

  def to_param
    #take the default and change it to a string
    #changes the url to be seo-friendly
    id.to_s + "-" + title.parameterize

  end

end
