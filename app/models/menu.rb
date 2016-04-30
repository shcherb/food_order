# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Menu < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :dishes

  validates :name, presence: true
end
