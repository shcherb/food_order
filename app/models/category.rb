class Category < ActiveRecord::Base
  has_many :dishs
  validates :name, presence: true
end
