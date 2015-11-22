class Product < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  validates :title, presence: true
  validates :title, length: { maximum: 32 }

  validates :description, presence: true
  validates :description, length: { maximum: 140 }

  def bid_active?
    self.deadline > Date.current.end_of_day
  end

  def get_winner
    User.find(best_bid.user_id)
  end

  def best_bid
    self.bids.order("amount DESC").first
  end
end
