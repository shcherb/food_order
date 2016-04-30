# == Schema Information
#
# Table name: dishes
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :decimal(, )
#  photo       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#

class Dish < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :menus, dependent: :destroy
  has_many :carts_dishes
  has_many :carts, through: :carts_dishes, dependent: :destroy
end
