class Organisation < ActiveRecord::Base
  has_one :user, autosave: true
  belongs_to :user
  has_many :users , autosave: true
  accepts_nested_attributes_for :user, :users
  
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
end
