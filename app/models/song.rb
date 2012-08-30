class Song < ActiveRecord::Base
  attr_accessible :name, :artist_attributes
  
  validates :name, presence: true
  validates :artist, presence: true
  
  belongs_to :artist, class_name: "User"
  
  accepts_nested_attributes_for :artist
end
