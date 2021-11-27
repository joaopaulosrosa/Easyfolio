class Wallet < ApplicationRecord
  belongs_to :user
  has_many :assets, dependent: :destroy
  has_one :strategy, dependent: :destroy
end
