class Category < ApplicationRecord
  has_many :products
  has_many :vendors, :through => :products
  
  validates :title, presence: true, length: { minimum: 5 }
end 
