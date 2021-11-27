class Strategy < ApplicationRecord
  belongs_to :wallet
  has_many :coin_shares, dependent: :destroy
end
