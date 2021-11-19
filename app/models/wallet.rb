class Wallet < ApplicationRecord
  belongs_to :user
  has_many :assets, dependent: :destroy
end
