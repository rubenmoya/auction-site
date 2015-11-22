class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :products

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true

  validates :username, length: {minimum: 3, maximum: 24}
  validates :username, presence: true
  validates :username, uniqueness: true
end
