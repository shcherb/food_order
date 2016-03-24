class Menu < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :dishes

  validates :name, presence: true
end
