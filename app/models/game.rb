class Game < ActiveRecord::Base
  belongs_to :user
  has_many :stories
  has_many :hints
end