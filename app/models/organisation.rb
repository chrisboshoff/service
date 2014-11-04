class Organisation < ActiveRecord::Base
  has_many :users , autosave: true
  accepts_nested_attributes_for :users
  
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
end
