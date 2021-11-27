class Strategy < ApplicationRecord
  belongs_to :wallet
  has_many :assets, dependent: :destroy
end
