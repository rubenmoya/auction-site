class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :amount, presence: true

  def self.persisted
    where.not(id: nil)
  end
end
