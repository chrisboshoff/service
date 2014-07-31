class Organisation < ActiveRecord::Base
  has_one :user
  belongs_to :user
  has_many :users
  accepts_nested_attributes_for :user
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
