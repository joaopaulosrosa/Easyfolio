class Wallet < ApplicationRecord
  belongs_to :user
  has_many :assets, dependent: :destroy
  has_one :strategy, dependet: :destroy
end
