class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :title, length: { maximum: 32 }

  validates :description, presence: true
  validates :description, length: { maximum: 140 }
end
