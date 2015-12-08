class User < ActiveRecord::Base
  has_many :games, dependent: :delete_all

  validates :name,    format: { with: /\A#{VALID_SYMBOLS}+\z/, message: "bad user name" },    presence: true
  validates :surname, format: { with: /\A#{VALID_SYMBOLS}+\z/, message: "bad user surname" }, presence: true
  validates :age,     format: { with: /\A[\d]*\z/, message: "bad user age" }
end





