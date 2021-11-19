class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :wallets, dependent: :destroy
  has_many :assets, through: :wallets
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :watchlist
end
