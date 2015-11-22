class Product < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true
  validates :title, length: { maximum: 32 }

  validates :description, presence: true
  validates :description, length: { maximum: 140 }
end
