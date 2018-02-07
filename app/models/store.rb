class Store < ApplicationRecord
  has_many :items
  belongs_to :user, :optional => true 
  validates_presence_of :name, :address, :status
end
